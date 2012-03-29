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
        public var drawStoneSignalton:DrawStoneOnBoardSignal;

        /**
         * Method handle the logic for <code>PlaceStoneCommand</code>
         */        
        override public function execute():void    
        {
            var isStoneThere:uint = gobanModel.getPlayerIDFromPlace(place.row, place.column);

            if (isStoneThere == ApplicationConstants.EMPTY_FIELD_ID)
            {
                gobanModel.placeStoneAt(place.row, place.column);
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
}
