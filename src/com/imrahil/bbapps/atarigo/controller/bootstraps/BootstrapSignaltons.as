package com.imrahil.bbapps.atarigo.controller.bootstraps
{
    import com.imrahil.bbapps.atarigo.signals.signaltons.ConfigCreatedSignal;
    import com.imrahil.bbapps.atarigo.signals.signaltons.GameParametersSignal;
    import com.imrahil.bbapps.atarigo.signals.signaltons.StartGameSignal;
    import com.imrahil.bbapps.atarigo.signals.signaltons.StopGameSignal;

    import org.robotlegs.core.IInjector;

    public class BootstrapSignaltons
    {
        public function BootstrapSignaltons(injector:IInjector)
        {
            injector.mapSingleton(ConfigCreatedSignal);
            injector.mapSingleton(GameParametersSignal);

            injector.mapSingleton(StartGameSignal);
            injector.mapSingleton(StopGameSignal);
        }
    }
}
