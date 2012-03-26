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

    import org.robotlegs.core.IMediatorMap;

    public class BootstrapViewMediators extends Object
    {
        public function BootstrapViewMediators(mediatorMap:IMediatorMap)
        {
            mediatorMap.mapView(AtariGoView, AtariGoViewMediator);
        }
    }
}