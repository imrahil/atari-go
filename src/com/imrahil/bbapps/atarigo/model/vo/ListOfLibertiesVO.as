/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.model.vo
{
    import utils.vector.VectorUtils;

    public class ListOfLibertiesVO
    {
        private var hiddenList:Vector.<StoneVO> = new <StoneVO>[];

        public function add(toAdd:StoneVO):void
        {
            if (hiddenList.lastIndexOf(toAdd) == -1)
                hiddenList.push(toAdd);
        }

        public function length():uint
        {
            return hiddenList.length;
        }

        public function deleteElement(stone:StoneVO):void
        {
            VectorUtils.removeItem(hiddenList, stone);
        }

        public function isNone():Boolean
        {
            return (hiddenList.length == 0);
        }

        public function getElements():Vector.<StoneVO>
        {
            return hiddenList;
        }

        public function appendList(listToAppend:ListOfLibertiesVO):void
        {
            for each (var currentLiberty:StoneVO in listToAppend.getElements())
            {
                 this.add(currentLiberty);
            }
        }
    }
}
