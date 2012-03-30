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

    public class ListOfGroupsVO
    {
        private var hiddenList:Vector.<GroupVO> = new <GroupVO>[];

        public function add(toAdd:GroupVO):void
        {
            if (hiddenList.lastIndexOf(toAdd) == -1)
                hiddenList.push(toAdd);
        }

        public function length():uint
        {
          return hiddenList.length;
        }

        public function first():GroupVO
        {
            return hiddenList[0];
        }

        public function deleteElement(groupToDelete:GroupVO):void
        {
            VectorUtils.removeItem(hiddenList, groupToDelete);
        }

        public function getElements():Vector.<GroupVO>
        {
            return hiddenList;
        }
    }
}
