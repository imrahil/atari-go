/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.signals.signaltons
{
    import com.imrahil.bbapps.atarigo.view.goban.IStoneView;

    import org.osflash.signals.Signal;

    public class DrawStoneOnBoardSignal extends Signal
    {
        public function DrawStoneOnBoardSignal()
        {
            super(IStoneView, uint);
        }
    }
}
