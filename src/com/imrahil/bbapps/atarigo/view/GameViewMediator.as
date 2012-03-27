/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.view
{
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
            view.exitSignal.add(onExitSignal);
        }

        private function onExitSignal():void
        {
            stopGameSignal.dispatch();
        }

//        protected function showGridOnView(event:DesignCreationEvent):void
//        {
//            view.showGrid(e.rows, e.columns);
//        }
    }
}
