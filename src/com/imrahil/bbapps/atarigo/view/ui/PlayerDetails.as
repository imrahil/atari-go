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

    import flash.display.Sprite;
    import flash.events.MouseEvent;

    import org.osflash.signals.Signal;

    public class PlayerDetails extends Sprite
    {
        public var exitSignal:Signal = new Signal();

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

        protected function init():void
        {
            _playerNameLabel = new PlayerNameLargeLabel();
            addChild(_playerNameLabel);

            _playerNameLabel.x = 10;
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
