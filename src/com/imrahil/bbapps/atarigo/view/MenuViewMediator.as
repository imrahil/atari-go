/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.view
{
    import com.imrahil.bbapps.atarigo.signals.StartGameSignal;

    import org.robotlegs.mvcs.SignalMediator;

    public class MenuViewMediator extends SignalMediator
    {
        /**
         * VIEW
         */
        [Inject]
        public var view:MenuView;

        /**
         * SIGNALTONS
         */
        [Inject]
        public var startGameSignal:StartGameSignal;

        /**
         * SIGNAL -> COMMAND
         */

        /**
         * CONSTRUCTOR 
         */
        public function MenuViewMediator()
        {
            super();
        }
        
        /** 
         * onRegister 
         * Override the invoked of the <code>IMediator</code> and allow you to place your own initialization. 
         */
        override public function onRegister():void
        {
            addToSignal(view.startSignal, onStartSignal);
            addToSignal(view.helpSignal, onHelpSignal);
        }

        private function onStartSignal():void
        {
            startGameSignal.dispatch();
        }

        private function onHelpSignal():void
        {

        }
    }
}
