package com.imrahil.bbapps.atarigo.model.vo
{
    import utils.vector.VectorUtils;

    public class ListOfStonesVO
    {
        private var hiddenList:Vector.<StoneVO> = new <StoneVO>[];

        public function add(toAdd:StoneVO):void
        {
            if (hiddenList.lastIndexOf(toAdd) == -1)
                hiddenList.push(toAdd);
        }

        public function deleteElement(stone:StoneVO):void
        {
            VectorUtils.removeItem(hiddenList, stone);
        }

        public function getElements():Vector.<StoneVO>
        {
            return hiddenList;
        }

        public function appendList(listToAppend:ListOfStonesVO):void
        {
            for each (var currentStone:StoneVO in listToAppend.getElements())
            {
                 this.add(currentStone);
            }
        }

        public function setGroup(groupToSetTo:GroupVO):void
        {
            for each (var currentStone:StoneVO in this.getElements())
            {
                currentStone.group = groupToSetTo;
            }
        }
    }
}
