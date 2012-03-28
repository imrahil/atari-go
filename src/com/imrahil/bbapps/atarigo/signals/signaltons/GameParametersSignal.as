/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.signals.signaltons
{
    import com.imrahil.bbapps.atarigo.model.vo.GobanSizeVO;
    import com.imrahil.bbapps.atarigo.model.vo.PlayerNamesVO;

    import org.osflash.signals.Signal;

    public class GameParametersSignal extends Signal
    {
        public function GameParametersSignal()
        {
            super(GobanSizeVO, PlayerNamesVO);
        }
    }
}
