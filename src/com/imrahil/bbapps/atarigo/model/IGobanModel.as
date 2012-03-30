/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.model
{
    import com.imrahil.bbapps.atarigo.model.vo.ListOfGroupsVO;
    import com.imrahil.bbapps.atarigo.model.vo.StoneVO;

    public interface IGobanModel
    {
        function loadDesign(gobanGrid:Vector.<Vector.<StoneVO>>):void;

        function getStoneAt(row:uint, column:uint):StoneVO;
        function addNewStone(row:uint, column:uint):StoneVO;
        function removeStoneAt(row:uint, column:uint):void;

        function get selectedPlayerID():uint;
        function set selectedPlayerID(value:uint):void;

        function get blackGroups():ListOfGroupsVO;
        function set blackGroups(value:ListOfGroupsVO):void;

        function get whiteGroups():ListOfGroupsVO;
        function set whiteGroups(value:ListOfGroupsVO):void;


    }
}
