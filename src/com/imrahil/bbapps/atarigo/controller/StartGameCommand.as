/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.controller 
{
    import com.imrahil.bbapps.atarigo.constants.ApplicationConstants;
    import com.imrahil.bbapps.atarigo.model.EmptyGoban;
    import com.imrahil.bbapps.atarigo.model.IConfigModel;
    import com.imrahil.bbapps.atarigo.model.IGobanModel;

    import org.robotlegs.mvcs.SignalCommand;

    public final class StartGameCommand extends SignalCommand
    {
        /** INJECTIONS **/
        [Inject]
        public var configModel:IConfigModel;

        [Inject]
        public var gobanModel:IGobanModel;

        /**
         * Method handle the logic for <code>CreateEmptyGobanCommand</code>
         */        
        override public function execute():void    
        {
            gobanModel.loadDesign(new EmptyGoban(configModel.gobanSize.gobanRows, configModel.gobanSize.gobanColumns).grid);
            gobanModel.selectedPlayerID = ApplicationConstants.PLAYER_ONE_ID;
        }
    }
}
