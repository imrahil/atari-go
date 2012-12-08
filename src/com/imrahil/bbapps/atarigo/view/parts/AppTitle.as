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
    import qnx.fuse.ui.text.TextAlign;
    import qnx.fuse.ui.text.TextFormat;

    public class AppTitle extends Label
    {
        public function AppTitle()
        {
            start();
        }

        protected function start():void
        {
            var format:TextFormat = new TextFormat();
            format.font = "Arial";
            format.size = 140;
            format.color = 0x000000;
            format.align = TextAlign.CENTER;

            this.format = format;
            this.text = "Atari GO";
        }
    }
}
