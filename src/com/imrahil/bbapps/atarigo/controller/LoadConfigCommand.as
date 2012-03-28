package com.imrahil.bbapps.atarigo.controller
{
    import com.imrahil.bbapps.atarigo.model.IConfigModel;
    import com.imrahil.bbapps.atarigo.model.values.DefaultGobanSize;
    import com.imrahil.bbapps.atarigo.model.values.DefaultPlayerNames;
    import com.imrahil.bbapps.atarigo.model.vo.GobanSizeVO;
    import com.imrahil.bbapps.atarigo.model.vo.PlayerNamesVO;
    import com.imrahil.bbapps.atarigo.signals.signaltons.ConfigCreatedSignal;

    import org.robotlegs.mvcs.SignalCommand;

    public class LoadConfigCommand extends SignalCommand
    {
        [Inject]
        public var configModel:IConfigModel;

        [Inject]
        public var configCreatedSignal:ConfigCreatedSignal;

        [Inject]
        public var defaultGobanSize:DefaultGobanSize;

        [Inject]
        public var defaultPlayerNames:DefaultPlayerNames;

        override public function execute():void
        {
            var gobanSize:GobanSizeVO = new GobanSizeVO();
            gobanSize.gobanRows = defaultGobanSize.rows;
            gobanSize.gobanColumns = defaultGobanSize.columns;

            configModel.gobanSize = gobanSize;

            var playerNames:PlayerNamesVO = new PlayerNamesVO();
            playerNames.playerOneName = defaultPlayerNames.playerOneName;
            playerNames.playerTwoName = defaultPlayerNames.playerTwoName;

            configModel.playerNames = playerNames;

            configCreatedSignal.dispatch();
        }
    }
}