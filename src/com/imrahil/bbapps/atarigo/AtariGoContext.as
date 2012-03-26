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
    import com.imrahil.bbapps.atarigo.controller.bootstraps.BootstrapViewMediators;
    import com.imrahil.bbapps.atarigo.view.AtariGoView;
    import com.imrahil.bbapps.atarigo.view.goban.IStoneFactory;
    import com.imrahil.bbapps.atarigo.view.goban.StoneFactory;

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
            new BootstrapConfigValues(injector);
            new BootstrapModels(injector);
            new BootstrapCommands(signalCommandMap);
            new BootstrapViewMediators(mediatorMap);

            addRootView();

            super.startup();
        }

        protected function addRootView():void
        {
            var stoneFactory:IStoneFactory = new StoneFactory(20);
            var mainView:AtariGoView = new AtariGoView(stoneFactory);
            contextView.addChild(mainView);
        }
    }
}
