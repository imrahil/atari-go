/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.model.vo
{
    import com.imrahil.bbapps.atarigo.constants.ApplicationConstants;

    public class StoneVO
    {
        public function StoneVO()
        {
        }

        public var row:uint;
        public var column:uint;

        public var state:uint = ApplicationConstants.EMPTY_FIELD_ID;

        public var liberties:ListOfLibertiesVO = new ListOfLibertiesVO();

        public var group:GroupVO = new GroupVO();

    }
}
