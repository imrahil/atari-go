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
    import com.imrahil.bbapps.atarigo.view.parts.SmallCornerCopyrights;

    import flash.desktop.NativeApplication;
    import flash.display.Sprite;
    import flash.events.Event;
    import flash.events.MouseEvent;

    import org.osflash.signals.Signal;

    import qnx.fuse.ui.dialog.AlertDialog;

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

            appTitle.y = 80;
            appTitle.width = stage.stageWidth;
            appTitle.height = 200;

            // START BUTTON
            var startBtn:LargeMenuButton = new LargeMenuButton();
            startBtn.label = "Play";
            startBtn.addEventListener(MouseEvent.CLICK, onStartBtnClick);
            addChild(startBtn);

            startBtn.x = (stage.stageWidth - startBtn.width) / 2;
            startBtn.y = 400;

            // HELP BUTTON
            var helpBtn:LargeMenuButton = new LargeMenuButton();
            helpBtn.label = "Help";
            helpBtn.addEventListener(MouseEvent.CLICK, onHelpBtnClick);
            addChild(helpBtn);

            helpBtn.x = (stage.stageWidth - helpBtn.width) / 2;;
            helpBtn.y = 620;

            // ABOUT BUTTON
            var aboutBtn:LargeMenuButton = new LargeMenuButton();
            aboutBtn.label = "About";
            aboutBtn.addEventListener(MouseEvent.CLICK, onAboutBtnClick);
            addChild(aboutBtn);

            aboutBtn.x = (stage.stageWidth - aboutBtn.width) / 2;;
            aboutBtn.y = 840;

            // COPYRIGHT
            var copyLabel:SmallCornerCopyrights = new SmallCornerCopyrights();
            addChild(copyLabel);

            copyLabel.width = stage.stageWidth - 10;
            copyLabel.y = stage.stageHeight - 30;
        }

        private function onStartBtnClick(event:MouseEvent):void
        {
            startSignal.dispatch();
        }

        private function onHelpBtnClick(event:MouseEvent):void
        {
            helpSignal.dispatch();
        }

        private function onAboutBtnClick(event:MouseEvent):void
        {
            CONFIG::device
            {
                var app_xml:XML = NativeApplication.nativeApplication.applicationDescriptor;
                var ns:Namespace = app_xml.namespace();
                var versionNumber:String = app_xml.ns::versionNumber;

                var aboutDialog:AlertDialog = new AlertDialog();
                aboutDialog.title = "Atari GO - v." + versionNumber;
                aboutDialog.message = "Author: Jarek Szczepański\n" +
                                      "Email: support_bb@imrahil.com\n" +
                                      "Website:\nhttp://imrahil.github.com/";
                aboutDialog.addButton("OK");
                aboutDialog.addEventListener(Event.SELECT, aboutButtonClicked);
                aboutDialog.show();
            }
        }

        private function aboutButtonClicked(event:Event):void
        {
            (event.currentTarget as AlertDialog).cancel();
        }
    }
}
