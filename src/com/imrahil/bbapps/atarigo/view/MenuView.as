/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.view
{
    import com.imrahil.bbapps.atarigo.view.parts.AppTitle;
    import com.imrahil.bbapps.atarigo.view.parts.LargeMenuButton;

    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;

    import org.osflash.signals.Signal;

    public class MenuView extends Sprite
    {
        public var startSignal:Signal = new Signal();
        public var helpSignal:Signal = new Signal();

        public function MenuView():void
        {
            this.addEventListener(Event.ADDED_TO_STAGE, create);
        }

        private function create(event:Event):void
        {
            this.removeEventListener(Event.ADDED_TO_STAGE, create);

            addMenuButtons();
        }

        private function addMenuButtons():void
        {
            var appTitle:AppTitle = new AppTitle();
            addChild(appTitle);

            appTitle.x = (stage.stageWidth - appTitle.width) / 2;
            appTitle.y = 60;

            // START BUTTON
            var startBtn:LargeMenuButton = new LargeMenuButton();
            startBtn.label = "Play";
            startBtn.addEventListener(MouseEvent.CLICK, onStartBtnClick);
            addChild(startBtn);

            startBtn.x = (stage.stageWidth - startBtn.width) / 2;
            startBtn.y = 350;

            // HELP BUTTON
            var helpBtn:LargeMenuButton = new LargeMenuButton();
            helpBtn.label = "Help";
            helpBtn.addEventListener(MouseEvent.CLICK, onHelpBtnClick);
            addChild(helpBtn);

            helpBtn.x = (stage.stageWidth - startBtn.width) / 2;
            helpBtn.y = 600;


        }

        private function onStartBtnClick(event:MouseEvent):void
        {
            startSignal.dispatch();
        }

        private function onHelpBtnClick(event:MouseEvent):void
        {
            helpSignal.dispatch();
        }
    }
}
