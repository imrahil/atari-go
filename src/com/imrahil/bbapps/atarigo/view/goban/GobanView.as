/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.view.goban
{
    import flash.display.Sprite;

    import org.osflash.signals.Signal;

    public class GobanView extends Sprite implements IGobanView
    {
        protected var _stoneFactory:IStoneFactory;
        protected var _groutLines:GroutLinesView;
        protected var _stonesView:GobanStonesView;

        public var placeStoneSignal:Signal = new Signal();

        public function GobanView(stoneFactory:IStoneFactory)
        {
            _stoneFactory = stoneFactory;
        }

        public function setGobanSize(rows:uint, columns:uint):void
        {
            addGrout(rows, columns);
            addTiles(rows, columns);
        }

        protected function addTiles(rows:uint, columns:uint):void
        {
            removeIfRequired(_stonesView);
            _stonesView = new GobanStonesView(_stoneFactory, rows, columns, placeStoneOnGoban);
            addChild(_stonesView);
            _stonesView.x = _stonesView.y = _stoneFactory.stoneSize / 2;
        }

        protected function placeStoneOnGoban(selectedStone:IStoneView, row:uint, column:uint):void
        {
            placeStoneSignal.dispatch(row, column, selectedStone);
        }

        protected function addGrout(rows:uint, columns:uint):void
        {
            removeIfRequired(_groutLines);
            _groutLines = new GroutLinesView(rows, columns, _stoneFactory.stoneSize);
            addChild(_groutLines);
        }

        protected function removeIfRequired(item:Sprite):void
        {
            if (item != null)
            {
                removeChild(item);
            }
        }
    }
}
