/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.view.goban
{
    import flash.display.DisplayObject;
    import flash.display.Sprite;
    import flash.events.MouseEvent;
    import flash.geom.Point;
    import flash.utils.Dictionary;

    public class GobanStonesView extends Sprite
    {
        protected var _stoneFactory:IStoneFactory;
        protected var _stones:Vector.<Vector.<IStoneView>>;
        protected var _positionsByStones:Dictionary;
        protected var _clickHandler:Function;

        public function GobanStonesView(stoneFactory:IStoneFactory, rows:uint, columns:uint, clickHandler:Function)
        {
            _stoneFactory = stoneFactory;
            _positionsByStones = new Dictionary();
            _clickHandler = clickHandler;
           
            addTiles(rows, columns);
        }

        public function get stones():Vector.<Vector.<IStoneView>>
        {
            return _stones;
        }

        protected function addTiles(rows:uint, columns:uint):void
        {
            _stones = Vector.<Vector.<IStoneView>>(new Gobanator().build(rows, columns, generateTile, Vector.<IStoneView> as Class));
        }

        protected function generateTile(i:uint, j:uint):IStoneView
        {
            var nextTile:IStoneView = _stoneFactory.createStone();
            _positionsByStones[nextTile] = new Point(j, i);
            nextTile.addEventListener(MouseEvent.CLICK, handleStoneClick, false, 0, true);
            addStoneAtPosition(nextTile, i, j);
            return nextTile;
        }

        protected function addStoneAtPosition(stone:IStoneView, row:uint, column:uint):void
        {
            var stoneSprite:DisplayObject = addChild(stone.asDisplayObject);
            stoneSprite.x = _stoneFactory.stoneSize * column;
            stoneSprite.y = _stoneFactory.stoneSize * row;
        }

        protected function handleStoneClick(e:MouseEvent):void
        {
            var selectedStone:IStoneView = (e.target as IStoneView);
            var column:uint = _positionsByStones[selectedStone].x;
            var row:uint = _positionsByStones[selectedStone].y;

            _clickHandler(selectedStone, row, column);
        }
    }
}
