/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.model.values
{
    public class DefaultGobanSize
    {
        protected var _rows:uint;
        protected var _columns:uint;

        public function DefaultGobanSize(rows:uint, columns:uint)
        {
            _rows = rows;
            _columns = columns;
        }

        public function get rows():uint
        {
            return _rows;
        }

        public function get columns():uint
        {
            return _columns;
        }
    }
}
