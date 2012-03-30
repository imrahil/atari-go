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
            drawLines(rows, columns, stoneSize);
        }

        protected function drawLines(rows:uint, columns:uint, stoneSize:Number):void
        {
            graphics.lineStyle(1, 0, 1, true, LineScaleMode.NORMAL, CapsStyle.NONE);
            var verticalLineHeight:Number = ((rows - 1) * stoneSize);
            var horizontalLineWidth:Number = ((columns - 1) * stoneSize);

            drawVerticalLines(columns, verticalLineHeight, stoneSize);
            drawHorizontalLines(rows, horizontalLineWidth, stoneSize);

            var hishiTengenSize:Number = stoneSize / 6;
            drawHoshi(rows, columns, stoneSize, hishiTengenSize);
            drawTengen(Math.floor(rows / 2), Math.floor(columns / 2), stoneSize, hishiTengenSize);
        }

        private function drawHoshi(rows:uint, columns:uint, stoneSize:Number, hishiTengenSize:Number):void
        {
            graphics.beginFill(0x000000);

            if (rows <= 9)
            {
                graphics.drawCircle(2 * stoneSize + stoneSize / 2, 2 * stoneSize + stoneSize / 2, hishiTengenSize);
                graphics.drawCircle((rows - 3) * stoneSize + stoneSize / 2, 2 * stoneSize + stoneSize / 2, hishiTengenSize);
                graphics.drawCircle(2 * stoneSize + stoneSize / 2, (columns - 3) * stoneSize + stoneSize / 2, hishiTengenSize);
                graphics.drawCircle((rows - 3) * stoneSize + stoneSize / 2, (columns - 3) * stoneSize + stoneSize / 2, hishiTengenSize);
            }
            else
            {
                graphics.drawCircle(3 * stoneSize + stoneSize / 2, 3 * stoneSize + stoneSize / 2, hishiTengenSize);
                graphics.drawCircle((rows - 4) * stoneSize + stoneSize / 2, 3 * stoneSize + stoneSize / 2, hishiTengenSize);
                graphics.drawCircle(3 * stoneSize + stoneSize / 2, (columns - 4) * stoneSize + stoneSize / 2, hishiTengenSize);
                graphics.drawCircle((rows - 4) * stoneSize + stoneSize / 2, (columns - 4) * stoneSize + stoneSize / 2, hishiTengenSize);
            }

            graphics.endFill();
        }

        private function drawTengen(row:uint, column:uint, stoneSize:Number, hishiTengenSize:Number):void
        {
            graphics.beginFill(0x000000);
            graphics.drawCircle(row * stoneSize + stoneSize / 2, column * stoneSize + stoneSize / 2, hishiTengenSize);
            graphics.endFill();
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