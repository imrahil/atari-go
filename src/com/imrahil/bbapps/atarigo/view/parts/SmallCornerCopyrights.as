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
            format.size = 15;
            format.color = 0x000000;

            this.format = format;
            this.autoSize = TextFieldAutoSize.LEFT;
            this.text = "Copyright © 2012 Jarek Szczepanski";
            this.setActualSize(this.textWidth, this.textHeight);
        }
    }
}
