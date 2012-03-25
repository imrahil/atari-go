/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo
{
    import flash.display.DisplayObjectContainer;

    import org.robotlegs.mvcs.SignalContext;

    public class AtariGoContext extends SignalContext
    {
        public function AtariGoContext(contextView:DisplayObjectContainer = null, autoStartup:Boolean = true)
        {
            super(contextView, autoStartup);
        }

        /**
         *  The Startup Hook
         */
        override public function startup():void
        {
            // todo: Add Commands

            // todo: Add Model

            // todo: Add Services

            // todo: Add View

            // todo: Add Singleton

            addRootView();

            super.startup();
        }

        protected function addRootView():void
        {

        }
    }
}
