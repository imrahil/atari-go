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

    import qnx.dialog.AlertDialog;
    import qnx.dialog.DialogSize;
    import qnx.display.IowWindow;

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
            startBtn.y = 300;

            // HELP BUTTON
            var helpBtn:LargeMenuButton = new LargeMenuButton();
            helpBtn.label = "Help";
            helpBtn.addEventListener(MouseEvent.CLICK, onHelpBtnClick);
            addChild(helpBtn);

            helpBtn.x = (stage.stageWidth - helpBtn.width) / 2;;
            helpBtn.y = 500;

            // ABOUT BUTTON
            var aboutBtn:LargeMenuButton = new LargeMenuButton();
            aboutBtn.label = "About";
            aboutBtn.addEventListener(MouseEvent.CLICK, onAboutBtnClick);
            addChild(aboutBtn);

            aboutBtn.x = (stage.stageWidth - aboutBtn.width) / 2;;
            aboutBtn.y = 700;

            // COPYRIGHT
            var copyLabel:SmallCornerCopyrights = new SmallCornerCopyrights();
            addChild(copyLabel);

            copyLabel.x = stage.stageWidth - copyLabel.width - 10;
            copyLabel.y = 1000;
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
                aboutDialog.messageHtml = "<p align='center'><b>Author:</b> Jarek Szczepański<br />" +
                                          "<b>Email:</b> support_bb@imrahil.com<br />" +
                                          "<b>Website:</b> http://flex.imrahil.com</p>";
                aboutDialog.addButton("OK");
                aboutDialog.dialogSize = DialogSize.SIZE_SMALL;
                aboutDialog.addEventListener(Event.SELECT, aboutButtonClicked);
                aboutDialog.show(IowWindow.getAirWindow().group);
            }
        }

        private function aboutButtonClicked(event:Event):void
        {
            (event.currentTarget as AlertDialog).cancel();
        }
    }
}
