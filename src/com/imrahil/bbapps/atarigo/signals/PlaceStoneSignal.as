/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.signals
{
    import com.imrahil.bbapps.atarigo.model.vo.PlaceVO;
    import com.imrahil.bbapps.atarigo.view.goban.IStoneView;

    import org.osflash.signals.Signal;

    public class PlaceStoneSignal extends Signal
    {
        public function PlaceStoneSignal()
        {
            super(PlaceVO, IStoneView);
        }
    }
}
