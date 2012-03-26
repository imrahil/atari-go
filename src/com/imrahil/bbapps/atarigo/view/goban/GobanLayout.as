/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.view.goban
{
    import flash.display.DisplayObject;

    public class GobanLayout extends Object
    {
        protected var _goban:DisplayObject;
        protected var _stoneSize:Number;
        protected var _workingWidth:Number;
        protected var _workingHeight:Number;

        public function GobanLayout(goban:DisplayObject, totalWidth:Number, totalHeight:Number, stoneSize:Number)
        {
            _goban = goban;
            _workingWidth = totalWidth - 1;
            _workingHeight = totalHeight - 1;
            _stoneSize = stoneSize;
        }

        public function resizeGridToFit(rows:uint, columns:uint):GobanLayout
        {
            var columnFit:Number = _workingWidth / columns;
            var rowFit:Number = _workingHeight / rows;

            var requiredTileSize:uint;
            var requiredScale:Number;

            if (columnFit <= rowFit)
            {
                requiredTileSize = Math.floor(_workingWidth / columns);
                requiredScale = requiredTileSize / _stoneSize;
            }
            else
            {
                requiredTileSize = Math.floor(_workingHeight / rows);
                requiredScale = requiredTileSize / _stoneSize;
            }

            _goban.scaleX = _goban.scaleY = requiredScale;

            return this;
        }

        public function centerGrid():GobanLayout
        {
            var spareWidth:Number = _workingWidth - _goban.width;
            var spareHeight:Number = _workingHeight - _goban.height;

            var xBorder:Number = Math.floor(spareWidth / 2);
            var yBorder:Number = Math.floor(spareHeight / 2);

            _goban.x = xBorder;
            _goban.y = yBorder;

            return this;
        }
    }
}