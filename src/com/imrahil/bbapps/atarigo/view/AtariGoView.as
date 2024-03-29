/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.view
{
    import com.imrahil.bbapps.atarigo.view.goban.IStoneFactory;
    import com.imrahil.bbapps.atarigo.view.goban.StoneFactory;

    import flash.display.Sprite;
    import flash.display.StageAlign;
    import flash.display.StageScaleMode;
    import flash.events.Event;

    public class AtariGoView extends Sprite
    {
        protected var _menuView:MenuView;
        protected var _gameView:GameView;

        public function AtariGoView():void
        {
            this.addEventListener(Event.ADDED_TO_STAGE, create);
        }

        private function create(event:Event):void
        {
            this.removeEventListener(Event.ADDED_TO_STAGE, create);

            stage.align = StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.NO_SCALE;

            addMenuView();
        }

        public function addMenuView():void
        {
            removeIfRequired(_gameView);

            _menuView = new MenuView();
            addChild(_menuView);
        }

        public function addGameView():void
        {
            removeIfRequired(_menuView);

            var stoneFactory:IStoneFactory = new StoneFactory(20);
            _gameView = new GameView(stoneFactory);
            addChild(_gameView);
        }

        protected function removeIfRequired(item:Sprite):void
        {
            if (item && contains(item))
            {
                removeChild(item);
            }
        }
    }
}
