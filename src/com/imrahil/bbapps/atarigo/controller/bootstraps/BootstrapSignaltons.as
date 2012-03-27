package com.imrahil.bbapps.atarigo.controller.bootstraps
{
    import com.imrahil.bbapps.atarigo.signals.signaltons.StartGameSignal;
    import com.imrahil.bbapps.atarigo.signals.signaltons.StopGameSignal;

    import org.robotlegs.core.IInjector;

    public class BootstrapSignaltons
    {
        public function BootstrapSignaltons(injector:IInjector)
        {
            injector.mapSingleton(StartGameSignal);
            injector.mapSingleton(StopGameSignal);
        }
    }
}
