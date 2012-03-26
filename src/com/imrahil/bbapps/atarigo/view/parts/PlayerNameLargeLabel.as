/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.view.parts
{
    import flash.text.TextFieldAutoSize;
    import flash.text.TextFormat;

    import qnx.fuse.ui.text.Label;

    public class PlayerNameLargeLabel extends Label
    {
        public function PlayerNameLargeLabel()
        {
            start();
        }

        protected function start():void
        {
            var labelFormat:TextFormat = new TextFormat();
            labelFormat.font = "Arial";
            labelFormat.size = 45;
            labelFormat.color = 0x000000;

            this.format = labelFormat;
            this.autoSize = TextFieldAutoSize.LEFT;
        }
    }
}
