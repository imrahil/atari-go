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

    import org.robotlegs.mvcs.*;

    public class ConfigModel extends Actor implements IConfigModel
    {
        protected var _gobanSize:GobanSizeVO;
        protected var _playerNames:PlayerNamesVO;

        public function get gobanSize():GobanSizeVO
        {
            return _gobanSize;
        }

        public function set gobanSize(size:GobanSizeVO):void
        {
            _gobanSize = size;
        }

        public function get playerNames():PlayerNamesVO
        {
            return _playerNames;
        }

        public function set playerNames(names:PlayerNamesVO):void
        {
            _playerNames = names;
        }
    }
}
