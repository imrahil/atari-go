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
    import com.imrahil.bbapps.atarigo.model.vo.PlayerNamesVO;

    public interface IConfigModel
    {
        function get gobanSize():GobanSizeVO;
        function set gobanSize(size:GobanSizeVO):void;

        function get playerNames():PlayerNamesVO;
        function set playerNames(names:PlayerNamesVO):void;
    }
}
