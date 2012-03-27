/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.view
{
    import com.imrahil.bbapps.atarigo.constants.Resources;
    import com.imrahil.bbapps.atarigo.view.goban.GobanLayout;
    import com.imrahil.bbapps.atarigo.view.goban.GobanView;
    import com.imrahil.bbapps.atarigo.view.goban.IStoneFactory;
    import com.imrahil.bbapps.atarigo.view.ui.PlayerDetails;

    import flash.display.Bitmap;
    import flash.display.Sprite;
    import flash.events.Event;

    import qnx.ui.display.Image;

    public class GameView extends Sprite
    {
        protected var _stoneFactory:IStoneFactory;
        protected var _goban:GobanView;

        public function GameView(stoneFactory:IStoneFactory)
        {
            _stoneFactory = stoneFactory;

            this.addEventListener(Event.ADDED_TO_STAGE, create);
        }

        private function create(event:Event):void
        {
            this.removeEventListener(Event.ADDED_TO_STAGE, create);

            addPlayerDetails();
        }

        private function addPlayerDetails():void
        {
            var appLogo:Bitmap = new Resources.GOBAN_IMAGE();
            var appLogoImage:Image = new Image();
            appLogoImage.setImage(appLogo);
            this.addChild(appLogoImage);

            appLogoImage.x = 0;
            appLogoImage.y = 212;

            var playerOneDetails:PlayerDetails = new PlayerDetails();
            addChild(playerOneDetails);

            playerOneDetails.x = 0;
            playerOneDetails.y = 812;
            playerOneDetails.setName("Player 1");

            var playerTwoDetails:PlayerDetails = new PlayerDetails();
            addChild(playerTwoDetails);

            playerTwoDetails.x = 600;
            playerTwoDetails.y = 212;
            playerTwoDetails.rotationZ = 180;
            playerTwoDetails.setName("Player 2");
        }

        public function showGrid(rows:uint, columns:uint):void
        {
            clear();
            _goban = new GobanView(_stoneFactory);
            _goban.setGobanSize(rows, columns);
            addChild(_goban);

            new GobanLayout(_goban, stage.stageWidth, stage.stageHeight, _stoneFactory.stoneSize)
                    .resizeGridToFit(rows, columns)
                    .centerGrid();
        }

        protected function clear():void
        {
            if (_goban && contains(_goban))
            {
                removeChild(_goban);
            }
        }
    }
}
