package com.splashEngine.game.screen {
    import com.splashEngine.engine.Screen;
    
    /**
     * The <code>ScreenTitle</code> class.
     * The screen used to compute and draw the title screen.
     *
     * @author MattuTyson
     */
    public class ScreenTitle extends Screen {
        
        /**
         * Constructor.
         */
        public function ScreenTitle() {
            super();
        }
        
        /**
         * @inheritDoc
         */
        override protected function created():void {
            super.created();
            changeScreen(new ScreenGame());
        }
        
        /**
         * @inheritDoc
         */
        override public function update():void {
            super.update();
        }
        
        /**
         * @inheritDoc
         */
        override public function render():void {
            super.render();
        }
    }
}