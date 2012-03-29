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
    import com.imrahil.bbapps.atarigo.model.vo.PlaceVO;
    import com.imrahil.bbapps.atarigo.signals.signaltons.DrawStoneOnBoardSignal;
    import com.imrahil.bbapps.atarigo.view.goban.IStoneView;

    import org.robotlegs.mvcs.SignalCommand;

    public final class PlaceStoneCommand extends SignalCommand 
    {
        /** PARAMETERS **/
        [Inject]
        public var place:PlaceVO;

        [Inject]
        public var selectedStoneView:IStoneView;

        /** INJECTIONS **/
        [Inject]
        public var gobanModel:IGobanModel;

        [Inject]
        public var configModel:IConfigModel;

        [Inject]
        public var drawStoneSignalton:DrawStoneOnBoardSignal;

        /**
         * Method handle the logic for <code>PlaceStoneCommand</code>
         */        
        override public function execute():void    
        {
            var row:uint = place.row;
            var column:uint = place.column;

            var isStoneThere:uint = gobanModel.getStoneInfoAt(row, column);

            if (isStoneThere == ApplicationConstants.EMPTY_FIELD_ID)
            {
                var isBreath:Boolean = checkBreaths(row, column);

                if (isBreath)
                {
                    gobanModel.placeStoneAt(row, column);
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
        }

        private function checkBreaths(row:uint, column:uint):Boolean
        {
            var isBreath:Boolean;

            if (row > 0 && gobanModel.getStoneInfoAt(row - 1, column) == ApplicationConstants.EMPTY_FIELD_ID)
                return true;

            if (row < configModel.gobanSize.gobanRows - 1 && gobanModel.getStoneInfoAt(row + 1, column) == ApplicationConstants.EMPTY_FIELD_ID)
                return true;

            if (column > 0 && gobanModel.getStoneInfoAt(row, column - 1) == ApplicationConstants.EMPTY_FIELD_ID)
                return true;

            if (column < configModel.gobanSize.gobanColumns - 1 && gobanModel.getStoneInfoAt(row, column + 1) == ApplicationConstants.EMPTY_FIELD_ID)
                return true;

            return false;
        }
    }
}
