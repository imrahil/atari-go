/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.view.goban
{
    public interface IStoneFactory
    {
        function get stoneSize():Number;

        function set stoneSize(size:Number):void;

//        function createStone():IStoneView;
    }
}
