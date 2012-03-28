/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.controller 
{
    import com.imrahil.bbapps.atarigo.model.IConfigModel;
    import com.imrahil.bbapps.atarigo.signals.signaltons.GameParametersSignal;

    import org.robotlegs.mvcs.SignalCommand;

    public final class GetGameParametersCommand extends SignalCommand
    {
        /** PARAMETERS **/

        /** INJECTIONS **/
        [Inject]
        public var configModel:IConfigModel;

        [Inject]
        public var gameParameters:GameParametersSignal;

        /**
         * Method handle the logic for <code>GetGameParametersCommand</code>
         */        
        override public function execute():void    
        {
            gameParameters.dispatch(configModel.gobanSize, configModel.playerNames);
        }
    }
}
