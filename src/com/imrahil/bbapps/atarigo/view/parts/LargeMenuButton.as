/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.view.parts
{
    import flash.text.TextFormat;
    import flash.text.TextFormatAlign;

    import qnx.fuse.ui.buttons.LabelButton;
    import qnx.fuse.ui.skins.SkinStates;

    public class LargeMenuButton extends LabelButton
    {
        public function LargeMenuButton()
        {
            start();
        }

        protected function start():void
        {
            var format:TextFormat = new TextFormat();
            format.font = "Arial";
            format.size = 50;
            format.color = 0x000000;
            format.align = TextFormatAlign.CENTER;

            this.setTextFormatForState(format, SkinStates.DISABLED);
            this.setTextFormatForState(format, SkinStates.UP);
            this.setTextFormatForState(format, SkinStates.DOWN);
            this.setTextFormatForState(format, SkinStates.SELECTED);
            this.setTextFormatForState(format, SkinStates.DISABLED_SELECTED);

            this.width = 400;
            this.height = 100;
        }
    }
}
