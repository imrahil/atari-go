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
    import com.imrahil.bbapps.atarigo.model.vo.GobanSizeVO;

    import org.robotlegs.mvcs.*;

    public class GobanModel extends Actor implements IGobanModel
    {
        protected var _gobanGrid:Vector.<Vector.<uint>>;
        protected var _selectedPlayerID:uint = ApplicationConstants.PLAYER_ONE_ID;

        public function loadDesign(gobanGrid:Vector.<Vector.<uint>>):void
        {
            _gobanGrid = gobanGrid;
        }

        public function getStoneInfoAt(row:uint, column:uint):uint
        {
            return _gobanGrid[row][column];
        }

        public function placeStoneAt(row:uint, column:uint):void
        {
            _gobanGrid[row][column] = _selectedPlayerID;
        }

        public function removeStoneAt(row:uint, column:uint):void
        {
            _gobanGrid[row][column] = ApplicationConstants.EMPTY_FIELD_ID;
        }

        public function get selectedPlayerID():uint
        {
            return _selectedPlayerID;
        }

        public function set selectedPlayerID(value:uint):void
        {
            _selectedPlayerID = value;
        }
    }
}
