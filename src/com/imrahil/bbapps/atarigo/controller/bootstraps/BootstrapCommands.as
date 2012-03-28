/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.controller.bootstraps
{
    import com.imrahil.bbapps.atarigo.controller.GetGameParametersCommand;
    import com.imrahil.bbapps.atarigo.controller.LoadConfigCommand;
    import com.imrahil.bbapps.atarigo.signals.GetGameParametersSignal;
    import com.imrahil.bbapps.atarigo.signals.StartupSignal;

    import org.robotlegs.core.ISignalCommandMap;

    public class BootstrapCommands
    {
        public function BootstrapCommands(commandMap:ISignalCommandMap)
        {
            commandMap.mapSignalClass(StartupSignal, LoadConfigCommand);
            commandMap.mapSignalClass(GetGameParametersSignal, GetGameParametersCommand);
        }
    }
}