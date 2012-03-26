/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.view.ui
{
    import com.imrahil.bbapps.atarigo.view.parts.PlayerNameLargeLabel;

    import flash.display.Sprite;

    public class PlayerDetails extends Sprite
    {
        protected var _playerNameLabel:PlayerNameLargeLabel;

        public function PlayerDetails()
        {
            init();
        }

        public function setName(value:String):void
        {
            _playerNameLabel.text = value;
        }

        protected function init():void
        {
            _playerNameLabel = new PlayerNameLargeLabel();
            addChild(_playerNameLabel);

            _playerNameLabel.x = 10;
            _playerNameLabel.y = 10;

            graphics.beginFill(0x000000, 0.1);
            graphics.drawRect(0, 0, 600, 212);
        }
    }
}
