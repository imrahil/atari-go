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

    public class SmallCornerCopyrights extends Label
    {
        public function SmallCornerCopyrights()
        {
            start();
        }

        protected function start():void
        {
            var format:TextFormat = new TextFormat();
            format.font = "Arial";
            format.size = 25;
            format.color = 0x000000;
            format.align = TextAlign.RIGHT;

            this.format = format;
            this.text = "Copyright © 2012 Jarek Szczepanski";
        }
    }
}
