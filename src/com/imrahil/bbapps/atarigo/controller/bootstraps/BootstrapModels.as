/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.controller.bootstraps
{
    import com.imrahil.bbapps.atarigo.model.ConfigModel;
    import com.imrahil.bbapps.atarigo.model.GobanModel;
    import com.imrahil.bbapps.atarigo.model.IConfigModel;
    import com.imrahil.bbapps.atarigo.model.IGobanModel;

    import org.robotlegs.core.IInjector;

    public class BootstrapModels
    {
        public function BootstrapModels(injector:IInjector)
        {
            injector.mapSingletonOf(IConfigModel, ConfigModel);
            injector.mapSingletonOf(IGobanModel, GobanModel);
        }
    }
}