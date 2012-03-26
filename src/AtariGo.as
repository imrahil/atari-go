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

    [SWF(width="600", height="1024", backgroundColor="#DCB35C", frameRate="30")]
    public class AtariGo extends Sprite
    {
        protected var _context:AtariGoContext;

        public function AtariGo()
        {
            _context = new AtariGoContext(this);
        }
    }
}
