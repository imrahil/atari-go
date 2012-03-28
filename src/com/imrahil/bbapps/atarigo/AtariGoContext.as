/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo
{
    import com.imrahil.bbapps.atarigo.controller.bootstraps.BootstrapCommands;
    import com.imrahil.bbapps.atarigo.controller.bootstraps.BootstrapConfigValues;
    import com.imrahil.bbapps.atarigo.controller.bootstraps.BootstrapModels;
    import com.imrahil.bbapps.atarigo.controller.bootstraps.BootstrapSignaltons;
    import com.imrahil.bbapps.atarigo.controller.bootstraps.BootstrapViewMediators;
    import com.imrahil.bbapps.atarigo.signals.StartupSignal;
    import com.imrahil.bbapps.atarigo.view.AtariGoView;

    import flash.display.DisplayObjectContainer;

    import org.osflash.signals.Signal;

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
            new BootstrapConfigValues(injector);
            new BootstrapModels(injector);
            new BootstrapSignaltons(injector);
            new BootstrapCommands(signalCommandMap);
            new BootstrapViewMediators(mediatorMap);

            addRootView();

            var signal:Signal = this.injector.getInstance(StartupSignal);
            signal.dispatch();
        }

        protected function addRootView():void
        {
            contextView.addChild(new AtariGoView());
        }
    }
}
