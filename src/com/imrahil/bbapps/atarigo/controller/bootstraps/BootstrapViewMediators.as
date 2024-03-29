/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package com.imrahil.bbapps.atarigo.controller.bootstraps
{

    import com.imrahil.bbapps.atarigo.view.AtariGoView;
    import com.imrahil.bbapps.atarigo.view.AtariGoViewMediator;
    import com.imrahil.bbapps.atarigo.view.GameView;
    import com.imrahil.bbapps.atarigo.view.GameViewMediator;
    import com.imrahil.bbapps.atarigo.view.MenuView;
    import com.imrahil.bbapps.atarigo.view.MenuViewMediator;
    import com.imrahil.bbapps.atarigo.view.goban.GobanView;
    import com.imrahil.bbapps.atarigo.view.goban.GobanViewMediator;

    import org.robotlegs.core.IMediatorMap;

    public class BootstrapViewMediators extends Object
    {
        public function BootstrapViewMediators(mediatorMap:IMediatorMap)
        {
            mediatorMap.mapView(AtariGoView, AtariGoViewMediator);

            mediatorMap.mapView(MenuView, MenuViewMediator);
            mediatorMap.mapView(GameView, GameViewMediator);

            mediatorMap.mapView(GobanView, GobanViewMediator);
        }
    }
}