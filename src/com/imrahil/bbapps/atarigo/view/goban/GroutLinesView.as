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
    import flash.geom.ColorTransform;

    public class GroutLinesView extends Sprite
    {
        public function GroutLinesView(rows:uint, columns:uint, stoneSize:Number)
        {
            drawLines(rows, columns, stoneSize);
        }

        public function set color(groutColor:uint):void
        {
            var useColor:ColorTransform = new ColorTransform();
            useColor.color = groutColor;
            transform.colorTransform = useColor;
        }

        protected function drawLines(rows:uint, columns:uint, stoneSize:Number):void
        {
            graphics.lineStyle(0, 0, 1);
            var verticalLineHeight:Number = (rows * stoneSize);
            var horizontalLineWidth:Number = (columns * stoneSize);

            drawVerticalLines(columns + 1, verticalLineHeight, stoneSize);
            drawHorizontalLines(rows + 1, horizontalLineWidth, stoneSize);
        }

        protected function drawVerticalLines(noOfLines:uint, lineHeight:Number, spacing:Number):void
        {
            graphics.moveTo(0, 0);
            var xPos:Number = 0;

            var iLength:uint = noOfLines;
            for (var i:int = 0; i < iLength; i++)
            {
                graphics.lineTo(xPos, lineHeight);
                xPos += spacing;
                graphics.moveTo(xPos, 0);
            }
        }

        protected function drawHorizontalLines(noOfLines:uint, lineWidth:Number, spacing:Number):void
        {
            graphics.moveTo(0, 0);
            var yPos:Number = 0;

            var iLength:uint = noOfLines;
            for (var i:int = 0; i < iLength; i++)
            {
                graphics.lineTo(lineWidth, yPos);
                yPos += spacing;
                graphics.moveTo(0, yPos);
            }
        }
    }
}