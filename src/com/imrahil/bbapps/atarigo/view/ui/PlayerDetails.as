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
    import flash.events.Event;
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
            this.addEventListener(Event.ADDED_TO_STAGE, create);
        }

        private function create(event:Event):void
        {
            this.removeEventListener(Event.ADDED_TO_STAGE, create);

            init();
        }

        public function set playerName(value:String):void
        {
            _playerNameLabel.text = value;
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
            _playerColor.x = 45;
            _playerColor.y = 45;

            addChild(_playerColor);
        }

        protected function init():void
        {
            _playerNameLabel = new PlayerNameLargeLabel();
            addChild(_playerNameLabel);

            _playerNameLabel.x = 90;
            _playerNameLabel.y = 18;

            _playerTurn = new Shape();
            _playerTurn.graphics.beginFill(0x993300, 1);
            _playerTurn.graphics.drawCircle(0, 43, 15);
            _playerTurn.graphics.endFill();
            _playerTurn.visible = false;
            addChild(_playerTurn);

            _playerTurn.x = 395;
            _playerTurn.y = 7;

            var _exitBtn:ExitGameButton = new ExitGameButton();
            _exitBtn.addEventListener(MouseEvent.CLICK, onExitBtnClick);
            addChild(_exitBtn);
            _exitBtn.x = (stage.stageWidth - _exitBtn.width) / 2;
            _exitBtn.y = 145;

            graphics.beginFill(0x000000, 0.1);
            graphics.drawRect(0, 0, stage.stageWidth, 250);
        }

        private function drawBlackPlayerColorIcon(matr:Matrix):Shape
        {
            var playerColorShape:Shape = new Shape();

            playerColorShape.graphics.beginGradientFill(GradientType.RADIAL, [0x777777, 0x000000], [1, 1], [0, 70], matr, SpreadMethod.PAD, InterpolationMethod.RGB, 0.3);
            playerColorShape.graphics.drawCircle(0, 0, 30);
            playerColorShape.graphics.endFill();

            return playerColorShape;
        }

        private function drawWhitePlayerColorIcon(matr:Matrix):Shape
        {
            var playerColorShape:Shape = new Shape();

            playerColorShape.graphics.beginGradientFill(GradientType.RADIAL, [0xFFFFFF, 0x000000], [1, 1], [50, 255], matr, SpreadMethod.PAD, InterpolationMethod.RGB);
            playerColorShape.graphics.drawCircle(0, 0, 30);
            playerColorShape.graphics.endFill();

            return playerColorShape;
        }

        private function onExitBtnClick(event:MouseEvent):void
        {
            exitSignal.dispatch();
        }
    }
}
