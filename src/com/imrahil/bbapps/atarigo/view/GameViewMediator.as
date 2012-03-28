/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.view
{
    import com.imrahil.bbapps.atarigo.model.vo.GobanSizeVO;
    import com.imrahil.bbapps.atarigo.model.vo.PlayerNamesVO;
    import com.imrahil.bbapps.atarigo.signals.signaltons.GameParametersSignal;
    import com.imrahil.bbapps.atarigo.signals.signaltons.StopGameSignal;

    import org.robotlegs.mvcs.SignalMediator;

    public class GameViewMediator extends SignalMediator
    {
        /**
         * VIEW
         */
        [Inject]
        public var view:GameView;

        /**
         * SIGNALTONS
         */
        [Inject]
        public var stopGameSignal:StopGameSignal;

        [Inject]
        public var gameParameters:GameParametersSignal;

        /**
         * SIGNAL -> COMMAND
         */

        /**
         * CONSTRUCTOR 
         */
        public function GameViewMediator()
        {
            super();
        }
        
        /** 
         * onRegister 
         * Override the invoked of the <code>IMediator</code> and allow you to place your own initialization. 
         */
        override public function onRegister():void
        {
            addToSignal(gameParameters, onGameParameters);
            addToSignal(view.exitSignal, onExitSignal);
        }

        private function onExitSignal():void
        {
            stopGameSignal.dispatch();
        }

        protected function onGameParameters(gobanSize:GobanSizeVO, playerNames:PlayerNamesVO):void
        {
            view.addGoban(gobanSize.gobanRows, gobanSize.gobanColumns);

            view.setPlayerOneName(playerNames.playerOneName);
            view.setPlayerTwoName(playerNames.playerTwoName);
        }
    }
}
