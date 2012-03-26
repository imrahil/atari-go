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

        }

//        protected function showGridOnView(event:DesignCreationEvent):void
//        {
//            view.showGrid(e.rows, e.columns);
//        }
    }
}
