/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.model
{
    import com.imrahil.bbapps.atarigo.constants.ApplicationConstants;
    import com.imrahil.bbapps.atarigo.model.vo.StoneVO;

    public class EmptyGoban
    {
        protected var _goban:Vector.<Vector.<StoneVO>>

        public function EmptyGoban(rows:uint, columns:uint)
        {
            _goban = createGoban(rows, columns);
        }

        public function get goban():Vector.<Vector.<StoneVO>>
        {
            return _goban;
        }

        protected function createGoban(rows:uint, columns:uint):Vector.<Vector.<StoneVO>>
        {
            var vectorOfZeros:Vector.<Vector.<StoneVO>> = new Vector.<Vector.<StoneVO>>();

            var iLength:uint = rows;
            var jLength:uint = columns;

            for (var i:int = 0; i < iLength; i++)
            {
                vectorOfZeros[i] = new Vector.<StoneVO>;

                for (var j:int = 0; j < jLength; j++)
                {
                    vectorOfZeros[i][j] = new StoneVO();
                    vectorOfZeros[i][j].row = i;
                    vectorOfZeros[i][j].column = j;
                    vectorOfZeros[i][j].state = ApplicationConstants.EMPTY_FIELD_ID;
                }
            }

            return vectorOfZeros;
        }
    }
}
