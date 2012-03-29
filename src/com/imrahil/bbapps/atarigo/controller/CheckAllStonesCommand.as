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
    import com.imrahil.bbapps.atarigo.signals.signaltons.WinMessageSignal;

    import org.robotlegs.mvcs.SignalCommand;

    public final class CheckAllStonesCommand extends SignalCommand 
    {
        /** PARAMETERS **/
        [Inject]
        public var selectedPlayerID:uint;

        /** INJECTIONS **/
        [Inject]
        public var gobanModel:IGobanModel;

        [Inject]
        public var configModel:IConfigModel;

        [Inject]
        public var winMessageSignal:WinMessageSignal;

        /**
         * Method handle the logic for <code>CheckAllStonesCommand</code>
         */        
        override public function execute():void    
        {
            var rows:uint = configModel.gobanSize.gobanRows;
            var columns:uint = configModel.gobanSize.gobanColumns;

            for (var i:int = 0; i < rows; i++)
            {
                for (var j:int = 0; j < columns; j++)
                {
                    var isBreath:Boolean = checkBreaths(i, j);

                    if (!isBreath)
                    {
                        winMessageSignal.dispatch(selectedPlayerID);
                        return;
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
