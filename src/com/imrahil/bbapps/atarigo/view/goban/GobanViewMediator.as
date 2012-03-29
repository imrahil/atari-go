/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.view.goban
{
    import com.imrahil.bbapps.atarigo.constants.ApplicationConstants;
    import com.imrahil.bbapps.atarigo.model.vo.PlaceVO;
    import com.imrahil.bbapps.atarigo.signals.PlaceStoneSignal;
    import com.imrahil.bbapps.atarigo.signals.signaltons.DrawStoneOnBoardSignal;

    import org.robotlegs.mvcs.SignalMediator;

    public class GobanViewMediator extends SignalMediator
    {
        /**
         * VIEW
         */
        [Inject]
        public var view:GobanView;

        /**
         * SIGNALTONS
         */
        [Inject]
        public var drawStoneSignal:DrawStoneOnBoardSignal;

        /**
         * SIGNAL -> COMMAND
         */
        [Inject]
        public var placeStoneSignal:PlaceStoneSignal;

        /**
         * CONSTRUCTOR 
         */
        public function GobanViewMediator()
        {
            super();
        }
        
        /** 
         * onRegister 
         * Override the invoked of the <code>IMediator</code> and allow you to place your own initialization. 
         */
        override public function onRegister():void
        {
            addToSignal(drawStoneSignal, drawStone);
            addToSignal(view.placeStoneSignal, onPlaceSignal)
        }

        private function onPlaceSignal(row:uint, column:uint, selectedStone:IStoneView):void
        {
            var place:PlaceVO = new PlaceVO();
            place.row = row;
            place.column = column;
            placeStoneSignal.dispatch(place, selectedStone);
        }

        private function drawStone(selectedStone:IStoneView, playerID:uint):void
        {
            if (playerID == ApplicationConstants.PLAYER_ONE_ID)
            {
                selectedStone.color = ApplicationConstants.PLAYER_ONE_COLOR_BLACK;
            }
            else
            {
                selectedStone.color = ApplicationConstants.PLAYER_TWO_COLOR_WHITE;
            }
        }
    }
}
