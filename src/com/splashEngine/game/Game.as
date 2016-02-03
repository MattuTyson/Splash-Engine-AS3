package com.splashEngine.game {
    import com.splashEngine.engine.Engine;
    import com.splashEngine.game.screen.ScreenTitle;
    
    /**
     * The <code>Game</code> class.
     * Extends <code>Engine</code> to make a game.
     *
     * @author MattuTyson
     */
    public class Game extends Engine {
        /**
         * The game's width (in pixels).
         */
        public static const WIDTH:int = 320; // Size iPod
        
        /**
         * The game's height (in pixels).
         */
        public static const HEIGHT:int = 480; // Size iPod
        
        /**
         * Constructor.
         */
        public function Game() {
            super(WIDTH, HEIGHT, 30);
            
            // Debug Mode.
            debugMode = false;
            displayDebug = false;
            
            // First screen.
            screen = new ScreenTitle();
        }
    }
}
