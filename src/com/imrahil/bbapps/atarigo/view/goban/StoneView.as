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
    import flash.display.Shape;
    import flash.display.Sprite;

    public class StoneView extends Sprite implements IStoneView
    {
        protected var _fill:Shape;
        protected var _stone:Shape;

        public function StoneView(stoneSize:Number)
        {
            drawContents(stoneSize);
        }

        public function placeStone(color_to_use:uint):void
        {
            _stone = new Shape();
            _stone.graphics.beginFill(color_to_use, 1);
            _stone.graphics.drawCircle(0, 0, _fill.width / 2 - (_fill.width / 2) * 0.05 );
            _stone.graphics.endFill();

            addChild(_stone);
        }

        public function get asDisplayObject():DisplayObject
        {
            return this;
        }

        protected function drawContents(tileSize:Number):void
        {
            _fill = new Shape();
            _fill.graphics.beginFill(0xFF0000, 0.25);
            var drawingCoord:Number = tileSize / 2;
            _fill.graphics.drawRect(-drawingCoord, -drawingCoord, tileSize, tileSize);
            _fill.graphics.endFill();

            addChild(_fill);
        }
    }
}
