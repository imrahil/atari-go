/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.view.ui
{
    import com.imrahil.bbapps.atarigo.constants.ApplicationConstants;
    import com.imrahil.bbapps.atarigo.view.parts.ExitGameButton;
    import com.imrahil.bbapps.atarigo.view.parts.PlayerNameLargeLabel;

    import flash.display.GradientType;
    import flash.display.InterpolationMethod;
    import flash.display.Shape;
    import flash.display.SpreadMethod;
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import flash.filters.DropShadowFilter;
    import flash.geom.Matrix;

    import org.osflash.signals.Signal;

    public class PlayerDetails extends Sprite
    {
        public var exitSignal:Signal = new Signal();

        protected var _playerColor:Shape;
        protected var _playerNameLabel:PlayerNameLargeLabel;
        protected var _playerTurn:Shape;

        public function PlayerDetails()
        {
            init();
        }

        public function set playerName(value:String):void
        {
            _playerNameLabel.text = value;
            _playerTurn.x = _playerNameLabel.x + _playerNameLabel.textWidth + 30;
        }

        public function get playerName():String
        {
            return _playerNameLabel.text;
        }

        public function set playerTurn(status:Boolean):void
        {
            _playerTurn.visible = status;
        }

        public function set playerColor(color_to_use:uint):void
        {
            var matr:Matrix = new Matrix();
            var radius:Number = 40;
            matr.createGradientBox(radius * 2, radius * 2, -40, -radius, -radius);

            if (color_to_use == ApplicationConstants.PLAYER_ONE_COLOR_BLACK)
            {
                _playerColor = drawBlackPlayerColorIcon(matr);
            }
            else
            {
                _playerColor = drawWhitePlayerColorIcon(matr);
            }

            var my_shadow:DropShadowFilter = new DropShadowFilter();
            my_shadow.color = 0x000000;
            my_shadow.blurY = 4;
            my_shadow.blurX = 4;
            my_shadow.angle = 45;
            my_shadow.alpha = .5;
            my_shadow.distance = 4;

            _playerColor.filters = [my_shadow]
            _playerColor.x = 30;
            _playerColor.y = 35;

            addChild(_playerColor);
        }

        protected function init():void
        {
            _playerNameLabel = new PlayerNameLargeLabel();
            addChild(_playerNameLabel);

            _playerNameLabel.x = 55;
            _playerNameLabel.y = 10;

            _playerTurn = new Shape();
            _playerTurn.graphics.beginFill(0x993300, 1);
            _playerTurn.graphics.drawCircle(0, 40, 10);
            _playerTurn.graphics.endFill();
            _playerTurn.visible = false;
            addChild(_playerTurn);

            var _exitBtn:ExitGameButton = new ExitGameButton();
            _exitBtn.addEventListener(MouseEvent.CLICK, onExitBtnClick);
            addChild(_exitBtn);
            _exitBtn.x = 250;
            _exitBtn.y = 155;

            graphics.beginFill(0x000000, 0.1);
            graphics.drawRect(0, 0, 600, 212);
        }

        private function drawBlackPlayerColorIcon(matr:Matrix):Shape
        {
            var playerColorShape:Shape = new Shape();

            playerColorShape.graphics.beginGradientFill(GradientType.RADIAL, [0x777777, 0x000000], [1, 1], [0, 70], matr, SpreadMethod.PAD, InterpolationMethod.RGB, 0.3);
            playerColorShape.graphics.drawCircle(0, 0, 20);
            playerColorShape.graphics.endFill();

            return playerColorShape;
        }

        private function drawWhitePlayerColorIcon(matr:Matrix):Shape
        {
            var playerColorShape:Shape = new Shape();

            playerColorShape.graphics.beginGradientFill(GradientType.RADIAL, [0xFFFFFF, 0x000000], [1, 1], [50, 255], matr, SpreadMethod.PAD, InterpolationMethod.RGB);
            playerColorShape.graphics.drawCircle(0, 0, 20);
            playerColorShape.graphics.endFill();

            return playerColorShape;
        }

        private function onExitBtnClick(event:MouseEvent):void
        {
            exitSignal.dispatch();
        }
    }
}
