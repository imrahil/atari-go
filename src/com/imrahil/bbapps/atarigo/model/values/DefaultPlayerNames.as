/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.model.values
{
    public class DefaultPlayerNames
    {
        protected var _playerOneName:String;
        protected var _playerTwoName:String;

        public function DefaultPlayerNames(playerOneName:String, playerTwoName:String)
        {
            _playerOneName = playerOneName;
            _playerTwoName = playerTwoName;
        }

        public function get playerOneName():String
        {
            return _playerOneName;
        }

        public function get playerTwoName():String
        {
            return _playerTwoName;
        }
    }
}

