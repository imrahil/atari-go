/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.view
{
    import com.imrahil.bbapps.atarigo.signals.signaltons.StartGameSignal;
    import com.imrahil.bbapps.atarigo.signals.signaltons.StopGameSignal;

    import org.robotlegs.mvcs.SignalMediator;

    public class AtariGoViewMediator extends SignalMediator
    {
        /**
         * VIEW
         */
        [Inject]
        public var view:AtariGoView;

        /**
         * SIGNALTONS
         */
        [Inject]
        public var startGameSignal:StartGameSignal;

        [Inject]
        public var stopGameSignal:StopGameSignal;

        /**
         * SIGNAL -> COMMAND
         */

        /**
         * CONSTRUCTOR 
         */
        public function AtariGoViewMediator()
        {
            super();
        }
        
        /** 
         * onRegister 
         * Override the invoked of the <code>IMediator</code> and allow you to place your own initialization. 
         */
        override public function onRegister():void
        {
            startGameSignal.add(addGameView);
            stopGameSignal.add(addMenuView);
        }

        private function addMenuView():void
        {
            view.addMenuView();
        }

        private function addGameView():void
        {
            view.addGameView();
        }
    }
}
