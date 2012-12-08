/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.view.parts
{
    import qnx.fuse.ui.text.Label;
    import qnx.fuse.ui.text.TextFormat;

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
            labelFormat.size = 55;
            labelFormat.color = 0x000000;

            this.format = labelFormat;
            this.width = 600;
            this.height = 100;
        }
    }
}
