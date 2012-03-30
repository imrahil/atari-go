package com.imrahil.bbapps.atarigo.model.vo
{
    public class GroupVO
    {
        public var playerID:uint;

        public var stones:ListOfStonesVO = new ListOfStonesVO();

        // group's liberties
        public var liberties:ListOfLibertiesVO = new ListOfLibertiesVO();


        public function GroupVO()
        {
        }

        public function init(stone:StoneVO):void
        {
            playerID = stone.state;
            stones.add(stone);

            liberties = stone.liberties;
        }

        public function hasNoLiberty():Boolean
        {
            return (liberties.isNone());
        }
    }
}
