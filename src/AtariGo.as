/*
 Copyright (c) 2012 Imrahil Corporation, All Rights Reserved
 @author   Jarek Szczepanski
 @contact  imrahil@imrahil.com
 @project  AtariGo
 @internal
 */
package
{
    import com.imrahil.bbapps.atarigo.AtariGoContext;

    import flash.display.Sprite;

    [SWF(height="1280", width="768", frameRate="60", backgroundColor="#DCB35C")]
    public class AtariGo extends Sprite
    {
        protected var _context:AtariGoContext;

        public function AtariGo()
        {
            _context = new AtariGoContext(this);
        }
    }
}
