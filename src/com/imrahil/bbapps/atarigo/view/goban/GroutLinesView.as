/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.view.goban
{
    import flash.display.CapsStyle;
    import flash.display.LineScaleMode;
    import flash.display.Sprite;
    import flash.geom.ColorTransform;

    public class GroutLinesView extends Sprite
    {
        public function GroutLinesView(rows:uint, columns:uint, stoneSize:Number)
        {
            drawLines(rows - 1, columns - 1, stoneSize);
        }

        public function set color(groutColor:uint):void
        {
            var useColor:ColorTransform = new ColorTransform();
            useColor.color = groutColor;
            transform.colorTransform = useColor;
        }

        protected function drawLines(rows:uint, columns:uint, stoneSize:Number):void
        {
            graphics.lineStyle(1, 0, 1, true, LineScaleMode.NORMAL, CapsStyle.NONE);
            var verticalLineHeight:Number = (rows * stoneSize);
            var horizontalLineWidth:Number = (columns * stoneSize);

            drawVerticalLines(columns + 1, verticalLineHeight, stoneSize);
            drawHorizontalLines(rows + 1, horizontalLineWidth, stoneSize);
        }

        protected function drawVerticalLines(noOfLines:uint, lineHeight:Number, spacing:Number):void
        {
            graphics.moveTo(spacing / 2, spacing / 2);
            var xPos:Number = spacing / 2;

            var iLength:uint = noOfLines;
            for (var i:int = 0; i < iLength; i++)
            {
                graphics.lineTo(xPos, lineHeight + spacing / 2);
                xPos += spacing;
                graphics.moveTo(xPos, spacing / 2);
            }
        }

        protected function drawHorizontalLines(noOfLines:uint, lineWidth:Number, spacing:Number):void
        {
            graphics.moveTo(spacing / 2, spacing / 2);
            var yPos:Number = spacing / 2;

            var iLength:uint = noOfLines;
            for (var i:int = 0; i < iLength; i++)
            {
                graphics.lineTo(lineWidth + spacing / 2, yPos);
                yPos += spacing;
                graphics.moveTo(spacing / 2, yPos);
            }
        }
    }
}