/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.view.ui
{
    import com.imrahil.bbapps.atarigo.view.parts.ExitGameButton;
    import com.imrahil.bbapps.atarigo.view.parts.PlayerNameLargeLabel;

    import flash.display.Shape;

    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import flash.geom.ColorTransform;

    import org.osflash.signals.Signal;

    public class PlayerDetails extends Sprite
    {
        public var exitSignal:Signal = new Signal();

        protected var _playerColor:Shape;
        protected var _playerNameLabel:PlayerNameLargeLabel;

        public function PlayerDetails()
        {
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

        public function set playerColor(color_to_use:uint):void
        {
            var updatedColor:ColorTransform = new ColorTransform();
            updatedColor.color = color_to_use;
            _playerColor.transform.colorTransform = updatedColor;
        }

        protected function init():void
        {
            _playerColor = new Shape();
            _playerColor.graphics.beginFill(0xFFFFFF, 1);
            _playerColor.graphics.drawCircle(30, 35, 20);
            _playerColor.graphics.endFill();
            addChild(_playerColor);

            _playerNameLabel = new PlayerNameLargeLabel();
            addChild(_playerNameLabel);

            _playerNameLabel.x = 55;
            _playerNameLabel.y = 10;

            var _exitBtn:ExitGameButton = new ExitGameButton();
            _exitBtn.addEventListener(MouseEvent.CLICK, onExitBtnClick);
            addChild(_exitBtn);
            _exitBtn.x = 250;
            _exitBtn.y = 155;

            graphics.beginFill(0x000000, 0.1);
            graphics.drawRect(0, 0, 600, 212);
        }

        private function onExitBtnClick(event:MouseEvent):void
        {
            exitSignal.dispatch();
        }
    }
}
