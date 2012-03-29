package com.imrahil.bbapps.atarigo.controller.bootstraps
{
    import com.imrahil.bbapps.atarigo.signals.signaltons.ConfigCreatedSignal;
    import com.imrahil.bbapps.atarigo.signals.signaltons.DrawStoneOnBoardSignal;
    import com.imrahil.bbapps.atarigo.signals.signaltons.GameParametersSignal;
    import com.imrahil.bbapps.atarigo.signals.signaltons.StopGameSignal;
    import com.imrahil.bbapps.atarigo.signals.signaltons.WinMessageSignal;

    import org.robotlegs.core.IInjector;

    public class BootstrapSignaltons
    {
        public function BootstrapSignaltons(injector:IInjector)
        {
            injector.mapSingleton(ConfigCreatedSignal);
            injector.mapSingleton(GameParametersSignal);

            injector.mapSingleton(StopGameSignal);

            injector.mapSingleton(DrawStoneOnBoardSignal);
            injector.mapSingleton(WinMessageSignal);
        }
    }
}
