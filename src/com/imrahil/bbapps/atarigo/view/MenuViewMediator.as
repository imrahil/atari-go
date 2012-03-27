/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.view
{
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
            view.startSignal.add(onStartSignal);
            view.helpSignal.add(onHelpSignal);
        }

        private function onStartSignal():void
        {

        }

        private function onHelpSignal():void
        {

        }
    }
}
