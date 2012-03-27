package com.imrahil.bbapps.atarigo.view.parts
{
    import flash.text.TextFieldAutoSize;
    import flash.text.TextFormat;
    import flash.text.TextFormatAlign;

    import qnx.fuse.ui.text.Label;

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
            format.size = 70;
            format.color = 0x000000;

            this.format = format;
            this.autoSize = TextFieldAutoSize.LEFT;
            this.text = "Atari GO";
            this.setActualSize(this.textWidth, this.textHeight);
        }
    }
}
