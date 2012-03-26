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

    public class GobanView extends Sprite implements IGobanView
    {
        protected var _groutColor:uint;
        protected var _stoneFactory:IStoneFactory;
        protected var _groutLines:GroutLinesView;
//        protected var _tilesView:GridTilesView;

        public function GobanView(stoneFactory:IStoneFactory)
        {
            _stoneFactory = stoneFactory;
        }

        public function setGobanSize(rows:uint, columns:uint):void
        {
            addTiles(rows, columns);
            addGrout(rows, columns);
        }

        public function set groutColor(color:uint):void
        {
            if (_groutLines && _groutColor != color)
            {
                _groutLines.color = color;
            }
            _groutColor = color;
        }

        protected function addTiles(rows:uint, columns:uint):void
        {
//            removeIfRequired(_tilesView);
//            _tilesView = new GridTilesView(_stoneFactory, rows, columns, changeTileColor);
//            addChild(_tilesView);
//            _tilesView.x = _tilesView.y = _stoneFactory.stoneSize / 2;
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