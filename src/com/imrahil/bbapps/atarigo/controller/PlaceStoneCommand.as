/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.controller 
{
    import com.imrahil.bbapps.atarigo.constants.ApplicationConstants;
    import com.imrahil.bbapps.atarigo.model.IConfigModel;
    import com.imrahil.bbapps.atarigo.model.IGobanModel;
    import com.imrahil.bbapps.atarigo.model.vo.GroupVO;
    import com.imrahil.bbapps.atarigo.model.vo.ListOfGroupsVO;
    import com.imrahil.bbapps.atarigo.model.vo.StoneVO;
    import com.imrahil.bbapps.atarigo.signals.signaltons.DrawStoneOnBoardSignal;
    import com.imrahil.bbapps.atarigo.signals.signaltons.WinMessageSignal;
    import com.imrahil.bbapps.atarigo.view.goban.IStoneView;

    import org.robotlegs.mvcs.SignalCommand;

    public final class PlaceStoneCommand extends SignalCommand
    {
        /** PARAMETERS **/
        [Inject]
        public var stone:StoneVO;

        [Inject]
        public var selectedStoneView:IStoneView;

        /** INJECTIONS **/
        [Inject]
        public var gobanModel:IGobanModel;

        [Inject]
        public var configModel:IConfigModel;

        [Inject]
        public var drawStoneSignalton:DrawStoneOnBoardSignal;

        [Inject]
        public var winMessageSignal:WinMessageSignal;

        /**
         * Method handle the logic for <code>PlaceStoneCommand</code>
         */        
        override public function execute():void    
        {
            var row:uint = stone.row;
            var column:uint = stone.column;

            var selectedPlace:StoneVO = gobanModel.getStoneAt(row, column);

            if (selectedPlace.state == ApplicationConstants.EMPTY_FIELD_ID)
            {
                var newStone:StoneVO = gobanModel.addNewStone(row, column);
                newStone.state = gobanModel.selectedPlayerID;

                var listOfNeighborFriends:ListOfGroupsVO = new ListOfGroupsVO();
                var listOfNeighborEnemies:ListOfGroupsVO = new ListOfGroupsVO();

                visitNewStoneNeighbors(newStone, listOfNeighborFriends, listOfNeighborEnemies);

                removeNeighborsLiberty(newStone, listOfNeighborFriends, listOfNeighborEnemies);

                updateStonesFriendGroups(newStone, listOfNeighborFriends);

                checkWinner(newStone, listOfNeighborEnemies);

                drawStoneSignalton.dispatch(selectedStoneView, gobanModel.selectedPlayerID);

                if (gobanModel.selectedPlayerID == ApplicationConstants.PLAYER_ONE_ID)
                {
                    gobanModel.selectedPlayerID = ApplicationConstants.PLAYER_TWO_ID;
                }
                else
                {
                    gobanModel.selectedPlayerID = ApplicationConstants.PLAYER_ONE_ID;
                }
            }
        }

        private function visitNewStoneNeighbors(stone:StoneVO, listOfNeighborFriends:ListOfGroupsVO, listOfNeighborEnemies:ListOfGroupsVO):void
        {
            var currentX:uint;
            var currentY:uint;

            if (stone.row > 0)
            {
               currentX = stone.row - 1;
               currentY = stone.column;

               processNeighbor(stone, currentX, currentY, listOfNeighborFriends, listOfNeighborEnemies);
            }

            if (stone.column > 0)
            {
               currentX = stone.row;
               currentY = stone.column - 1;

               processNeighbor(stone, currentX, currentY, listOfNeighborFriends, listOfNeighborEnemies);
            }

            if (stone.row < configModel.gobanSize.gobanRows - 1)
            {
               currentX = stone.row + 1;
               currentY = stone.column;

               processNeighbor(stone, currentX, currentY, listOfNeighborFriends, listOfNeighborEnemies);
            }

            if (stone.column < configModel.gobanSize.gobanColumns - 1)
            {
               currentX = stone.row;
               currentY = stone.column + 1;

               processNeighbor(stone, currentX, currentY, listOfNeighborFriends, listOfNeighborEnemies);
            }
        }

        private function processNeighbor(stone:StoneVO, currentX:uint, currentY:uint, listOfNeighborFriends:ListOfGroupsVO, listOfNeighborEnemies:ListOfGroupsVO):void
        {
            if (gobanModel.getStoneAt(currentX, currentY).state == ApplicationConstants.EMPTY_FIELD_ID)
            {
                stone.liberties.add(gobanModel.getStoneAt(currentX, currentY));
                gobanModel.getStoneAt(currentX, currentY).liberties.deleteElement(stone);
                return;
            }
            else if (gobanModel.getStoneAt(currentX, currentY).state == stone.state)
            {
                listOfNeighborFriends.add(gobanModel.getStoneAt(currentX, currentY).group);
            }
            else
            {
                listOfNeighborEnemies.add(gobanModel.getStoneAt(currentX, currentY).group);
            }
        }

        private function removeNeighborsLiberty(stone:StoneVO, listOfNeighborFriends:ListOfGroupsVO, listOfNeighborEnemies:ListOfGroupsVO):void
        {
            var currentGroup:GroupVO;

            for each (currentGroup in listOfNeighborFriends.getElements())
            {
                currentGroup.liberties.deleteElement(stone);
            }

            for each (currentGroup in listOfNeighborEnemies.getElements())
            {
                currentGroup.liberties.deleteElement(stone);
            }
        }

        private function updateStonesFriendGroups(stone:StoneVO, listOfNeighborFriends:ListOfGroupsVO):void
        {
            if (listOfNeighborFriends.length() == 0)
            {
                newBornGroup(stone);
            }
            else if (listOfNeighborFriends.length() == 1)
            {
                addStoneToGroup(stone, listOfNeighborFriends.first());
            }
            else
            {
                connectMoreGroups(stone, listOfNeighborFriends);
            }
        }

        private function newBornGroup(stone:StoneVO):void
        {
            var newGroup:GroupVO = new GroupVO();
            newGroup.init(stone);
            stone.group = newGroup;

            if (newGroup.playerID == ApplicationConstants.PLAYER_ONE_ID)
            {
                gobanModel.blackGroups.add(newGroup);
            }
            else
            {
                gobanModel.whiteGroups.add(newGroup);
            }
        }

        private function addStoneToGroup(stone:StoneVO, groupVO:GroupVO):void
        {
            groupVO.stones.add(stone);

            stone.group = groupVO;

            groupVO.liberties.appendList(stone.liberties);
        }

        private function connectMoreGroups(stone:StoneVO, listOfNeighborFriends:ListOfGroupsVO):void
        {
            var theGroup:GroupVO = listOfNeighborFriends.first();

            for each (var oneMoreGroup:GroupVO in listOfNeighborFriends)
            {
                oneMoreGroup.stones.setGroup(theGroup);

                theGroup.liberties.appendList(oneMoreGroup.liberties);
                theGroup.stones.appendList(oneMoreGroup.stones);

                if (stone.state == ApplicationConstants.PLAYER_ONE_ID)
                {
                    gobanModel.blackGroups.deleteElement(oneMoreGroup);
                }
                else
                {
                    gobanModel.whiteGroups.deleteElement(oneMoreGroup);
                }
            }

            addStoneToGroup(stone, theGroup);
        }

        private function checkWinner(stone:StoneVO, listOfNeighborEnemies:ListOfGroupsVO):void
        {
            for each (var currentGroup:GroupVO in listOfNeighborEnemies.getElements())
            {
                if (currentGroup.hasNoLiberty())
                {
                    if (currentGroup.playerID == ApplicationConstants.PLAYER_ONE_ID)
                    {
                        winMessageSignal.dispatch(ApplicationConstants.PLAYER_TWO_ID);
                    }
                    else
                    {
                        winMessageSignal.dispatch(ApplicationConstants.PLAYER_ONE_ID);
                    }
                }
            }
        }
    }
}
