/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.model
{
    import com.imrahil.bbapps.atarigo.constants.ApplicationConstants;
    import com.imrahil.bbapps.atarigo.model.vo.ListOfGroupsVO;
    import com.imrahil.bbapps.atarigo.model.vo.StoneVO;

    import org.robotlegs.mvcs.*;

    public class GobanModel extends Actor implements IGobanModel
    {
        protected var _gobanGrid:Vector.<Vector.<StoneVO>>;
        protected var _selectedPlayerID:uint = ApplicationConstants.PLAYER_ONE_ID;

        protected var _blackGroups:ListOfGroupsVO = new ListOfGroupsVO();
        protected var _whiteGroups:ListOfGroupsVO = new ListOfGroupsVO();

        public function loadDesign(gobanGrid:Vector.<Vector.<StoneVO>>):void
        {
            _gobanGrid = gobanGrid;
        }

        public function getStoneAt(row:uint, column:uint):StoneVO
        {
            return _gobanGrid[row][column];
        }

        public function addNewStone(row:uint, column:uint):StoneVO
        {
            _gobanGrid[row][column].state = _selectedPlayerID;
            return _gobanGrid[row][column];
        }

        public function removeStoneAt(row:uint, column:uint):void
        {
            _gobanGrid[row][column].state = ApplicationConstants.EMPTY_FIELD_ID;
        }

        public function get selectedPlayerID():uint
        {
            return _selectedPlayerID;
        }

        public function set selectedPlayerID(value:uint):void
        {
            _selectedPlayerID = value;
        }

        public function get blackGroups():ListOfGroupsVO
        {
            return _blackGroups;
        }

        public function set blackGroups(value:ListOfGroupsVO):void
        {
            _blackGroups = value;
        }

        public function get whiteGroups():ListOfGroupsVO
        {
            return _whiteGroups;
        }

        public function set whiteGroups(value:ListOfGroupsVO):void
        {
            _whiteGroups = value;
        }
    }
}
