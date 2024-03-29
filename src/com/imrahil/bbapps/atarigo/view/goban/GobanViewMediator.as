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
    import com.imrahil.bbapps.atarigo.model.vo.StoneVO;
    import com.imrahil.bbapps.atarigo.signals.PlaceStoneSignal;
    import com.imrahil.bbapps.atarigo.signals.signaltons.DrawStoneOnBoardSignal;
    import com.imrahil.bbapps.atarigo.signals.signaltons.WinMessageSignal;

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

        [Inject]
        public var winMessageSignal:WinMessageSignal;

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
            addToSignal(winMessageSignal, onWinMessage);
            addToSignal(view.placeStoneSignal, onPlaceSignal)
        }

        private function drawStone(selectedStone:IStoneView, playerID:uint):void
        {
            if (playerID == ApplicationConstants.PLAYER_ONE_ID)
            {
                selectedStone.placeStone(ApplicationConstants.PLAYER_ONE_COLOR_BLACK);
            }
            else
            {
                selectedStone.placeStone(ApplicationConstants.PLAYER_TWO_COLOR_WHITE);
            }
        }

        private function onWinMessage(selectedPlayerID:uint):void
        {
            signalMap.removeFromSignal(view.placeStoneSignal, onPlaceSignal);
        }

        private function onPlaceSignal(row:uint, column:uint, selectedStone:IStoneView):void
        {
            var place:StoneVO = new StoneVO();
            place.row = row;
            place.column = column;
            placeStoneSignal.dispatch(place, selectedStone);
        }
    }
}
