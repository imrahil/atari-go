/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.view.goban
{
    public class StoneFactory implements IStoneFactory
    {
        private var _stoneSize:Number;

        public function StoneFactory(stoneSize:Number)
        {
            _stoneSize = stoneSize;
        }

        public function get stoneSize():Number
        {
            return _stoneSize;
        }

        public function set stoneSize(size:Number):void
        {
            _stoneSize = size;
        }

        public function createStone():IStoneView
        {
            return new StoneView(_stoneSize);
        }
    }
}
