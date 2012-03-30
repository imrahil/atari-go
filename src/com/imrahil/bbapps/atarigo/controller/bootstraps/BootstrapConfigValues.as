/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.controller.bootstraps
{
    import com.imrahil.bbapps.atarigo.model.values.DefaultGobanSize;
    import com.imrahil.bbapps.atarigo.model.values.DefaultPlayerNames;

    import org.robotlegs.core.IInjector;

    public class BootstrapConfigValues
    {
        public function BootstrapConfigValues(injector:IInjector)
        {
            injector.mapValue(DefaultPlayerNames, new DefaultPlayerNames("Player One", "Player Two"));
            injector.mapValue(DefaultGobanSize, new DefaultGobanSize(9, 9));
        }
    }
}
