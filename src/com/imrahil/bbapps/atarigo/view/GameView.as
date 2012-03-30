/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.view
{
    import com.imrahil.bbapps.atarigo.constants.ApplicationConstants;
    import com.imrahil.bbapps.atarigo.view.goban.GobanLayout;
    import com.imrahil.bbapps.atarigo.view.goban.GobanView;
    import com.imrahil.bbapps.atarigo.view.goban.IStoneFactory;
    import com.imrahil.bbapps.atarigo.view.ui.PlayerDetails;

    import flash.display.Sprite;
    import flash.events.Event;

    import org.osflash.signals.Signal;

    import qnx.dialog.AlertDialog;
    import qnx.dialog.DialogSize;
    import qnx.display.IowWindow;

    public class GameView extends Sprite
    {
        public var exitSignal:Signal = new Signal();

        protected var _stoneFactory:IStoneFactory;
        protected var _goban:GobanView;

        protected var playerOneDetails:PlayerDetails;
        protected var playerTwoDetails:PlayerDetails;

        public function GameView(stoneFactory:IStoneFactory)
        {
            _stoneFactory = stoneFactory;

            this.addEventListener(Event.ADDED_TO_STAGE, create);
        }

        private function create(event:Event):void
        {
            this.removeEventListener(Event.ADDED_TO_STAGE, create);

            addPlayerDetails();
        }

        public function addGoban(rows:int, columns:int):void
        {
            _goban = new GobanView(_stoneFactory);
            _goban.setGobanSize(rows, columns);
            addChild(_goban);

            new GobanLayout(_goban, stage.stageWidth, stage.stageHeight, _stoneFactory.stoneSize)
                    .resizeGridToFit(rows, columns)
                    .centerGrid();
        }

        public function setPlayerNames(playerOneName:String, playerTwoName:String):void
        {
            playerOneDetails.playerName = playerOneName;
            playerTwoDetails.playerName = playerTwoName;
        }

        public function setWinner(selectedPlayerID:uint):void
        {
            CONFIG::device
            {
                var aboutDialog:AlertDialog = new AlertDialog();
                var message:String;

                if (selectedPlayerID == ApplicationConstants.PLAYER_ONE_ID)
                {
                    message = playerOneDetails.playerName + " - won a game!";
                }
                else
                {
                    message = playerTwoDetails.playerName + " - won a game!";
                }

                aboutDialog.title = "Winner!";
                aboutDialog.message = message;

                aboutDialog.addButton("OK");
                aboutDialog.dialogSize = DialogSize.SIZE_SMALL;
                aboutDialog.addEventListener(Event.SELECT, onClose);
                aboutDialog.show(IowWindow.getAirWindow().group);
            }
        }

        private function onClose(event:Event):void
        {
            exitSignal.dispatch();
        }

        private function addPlayerDetails():void
        {
            playerOneDetails = new PlayerDetails();
            playerOneDetails.exitSignal.add(onPlayerOneExit);
            addChild(playerOneDetails);

            playerOneDetails.x = 0;
            playerOneDetails.y = 812;
//            playerOneDetails.setName("Player 1");

            playerTwoDetails = new PlayerDetails();
            playerTwoDetails.exitSignal.add(onPlayerTwoExit);
            addChild(playerTwoDetails);

            playerTwoDetails.x = stage.stageWidth;
            playerTwoDetails.y = 212;
            playerTwoDetails.rotationZ = 180;
//            playerTwoDetails.setName("Player 2");
        }

        private function onPlayerOneExit():void
        {
            exitSignal.dispatch();
        }

        private function onPlayerTwoExit():void
        {
            exitSignal.dispatch();
        }
    }
}
