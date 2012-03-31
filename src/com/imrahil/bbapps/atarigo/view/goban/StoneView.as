/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.view.goban
{
    import com.imrahil.bbapps.atarigo.constants.ApplicationConstants;

    import flash.display.DisplayObject;
    import flash.display.GradientType;
    import flash.display.InterpolationMethod;
    import flash.display.Shape;
    import flash.display.SpreadMethod;
    import flash.display.Sprite;
    import flash.filters.DropShadowFilter;
    import flash.geom.Matrix;

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
            var matr:Matrix = new Matrix();
            var radius:Number = _fill.width;
            matr.createGradientBox(radius * 2, radius * 2, -40, -radius, -radius);

            if (color_to_use == ApplicationConstants.PLAYER_ONE_COLOR_BLACK)
            {
                _stone = drawBlackStone(matr);
            }
            else
            {
                _stone = drawWhiteStone(matr);
            }

            var my_shadow:DropShadowFilter = new DropShadowFilter();
            my_shadow.color = 0x000000;
            my_shadow.blurY = 4;
            my_shadow.blurX = 4;
            my_shadow.angle = 45;
            my_shadow.alpha = .5;
            my_shadow.distance = 4;

            _stone.filters = [my_shadow]
            addChild(_stone);
        }

        private function drawBlackStone(matr:Matrix):Shape
        {
            var stoneShape:Shape = new Shape();

            stoneShape.graphics.beginGradientFill(GradientType.RADIAL, [0x777777, 0x000000], [1, 1], [0, 70], matr, SpreadMethod.PAD, InterpolationMethod.RGB, 0.3);
            stoneShape.graphics.drawCircle(0, 0, _fill.width / 2 - (_fill.width / 2) * 0.05);
            stoneShape.graphics.endFill();

            return stoneShape;
        }

        private function drawWhiteStone(matr:Matrix):Shape
        {
            var stoneShape:Shape = new Shape();

            stoneShape.graphics.beginGradientFill(GradientType.RADIAL, [0xFFFFFF, 0x000000], [1, 1], [50, 255], matr, SpreadMethod.PAD, InterpolationMethod.RGB);
            stoneShape.graphics.drawCircle(0, 0, _fill.width / 2 - (_fill.width / 2) * 0.05);
            stoneShape.graphics.endFill();

            return stoneShape;
        }

        public function get asDisplayObject():DisplayObject
        {
            return this;
        }

        protected function drawContents(tileSize:Number):void
        {
            _fill = new Shape();
            _fill.graphics.beginFill(0xFF0000, 0);
            var drawingCoord:Number = tileSize / 2;
            _fill.graphics.drawRect(-drawingCoord, -drawingCoord, tileSize, tileSize);
            _fill.graphics.endFill();

            addChild(_fill);
        }
    }
}
