/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.model
{
    import com.imrahil.bbapps.atarigo.model.vo.GobanSizeVO;

    public interface IGobanModel
    {
        function loadDesign(gobanGrid:Vector.<Vector.<uint>>):void;

        function placeStoneAt(row:uint, column:uint):void;
        function removeStoneAt(row:uint, column:uint):void;
        function getPlayerIDFromPlace(row:uint, column:uint):uint;

        function get selectedPlayerID():uint;
        function set selectedPlayerID(value:uint):void;
    }
}
