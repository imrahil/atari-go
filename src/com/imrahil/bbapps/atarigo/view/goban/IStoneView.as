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
    import flash.events.IEventDispatcher;

    public interface IStoneView extends IEventDispatcher
    {
        function placeStone(color_to_use:uint):void;

        function get asDisplayObject():DisplayObject;
    }
}
