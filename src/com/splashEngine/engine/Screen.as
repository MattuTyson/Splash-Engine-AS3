package com.splashEngine.engine {
    import com.splashEngine.engine.Engine;
    import com.splashEngine.engine.entities.Entity;
    import com.splashEngine.engine.entities.Sprite;
    import flash.display.BitmapData;
    
    /**
     * The <code>Screen</code> class.
     * Define a way to compute and draw stuff according to an <code>Engine</code>.
     * 
     * @author MattuTyson
     */
    public class Screen extends BaseClass { // extends EventDispatcher to delete engine variable
        /**
         * The width of the screen.
         */
        private var _width:uint;
        
        /**
         * The height of the screen.
         */
        private var _height:uint;
        
        /**
         * The Engine associated to the screen.
         * You should never modify this.
         * It is automatically updated after the constructeur.
         */
        protected var _engine:Engine;
        
        /**
         * The BitmapData used to draw the screen.
         */
        protected var _bitmapData:BitmapData;
        
        /**
         * The array of entities.
         */
        public var _entities:Array;
        
        /**
         * Constructor.
         */
        public function Screen() {
            super();
            _entities = new Array();
        }
        
        /**
         * Fired when the engine variable is created.
         */
        protected function created():void {
            bitmapData = new BitmapData(_engine.width, _engine.height, false, 0x000000);
        }
        
        /**
         * Fired every frame.
         * Override this when you need to compute stuff.
         */
        public function update():void {
            for each (var entity:Entity in _entities) {
                entity.update();
            }
        }
        
        /**
         * Fired every frames.
         * Override this when you need to render stuff.
         */
        public function render():void {
            for each (var entity:Entity in _entities) {
                entity.render();
            }
        }
        
        /**
         * Fired at the very end of every frame.
         * Draw every entities (that may have been updated and rendered) onto the screen.
         */
        public function draw():void {
            for each (var entity:Entity in _entities) {
                if (entity is Sprite) {
                    bitmapData.copyPixels((entity as Sprite).bitmapData, ((entity as Sprite)).bitmapData.rect, entity.point);    
                }
            }
        }
        
        /**
         * Clear the screen.
         */
        public function clear():void {
            bitmapData.fillRect(bitmapData.rect, 0x000000);
        }
        
        /**
         * Add a reference of an entity into the screen.
         * Allows us to call the <code>update</code> and <code>render</code> methods in Entity.
         * @param entity the entity you want to add to the screen.
         */
        public function add(entity:Entity):void {
            _entities.push(entity);
        }
        
        /**
         * Change the current screen with an other one.
         * @param screen the new screen you want to set.
         */
        protected function changeScreen(screen:Screen):void {
            if (!_engine) {
                throw new Error("You can not change the screen in constructor. Change it in an override of the created() function instead.");
            }
            engine.screen = screen;
        }
        
        /**
         * The Engine associated to the screen.
         * You should never modify this.
         * It is automatically updated after the constructeur.
         */
        public function get engine():Engine {
            return _engine;
        }
        
        /**
         * The Engine associated to the screen.
         * You should never modify this.
         * It is automatically updated after the constructeur.
         * TODO : no engine.
         */
        public function set engine(value:Engine):void {
            var isCreated:Boolean = _engine == null;
            _engine = value;
            width = _engine.width;
            height = _engine.height;
            if (isCreated) {
                created();
            }
        }
        
        /**
         * The width of the screen.
         */
        public function get width():uint {
            return _width;
        }
        
        /**
         * The width of the screen.
         */
        public function set width(value:uint):void {
            _width = value;
        }
        
        /**
         * The width of the screen.
         */
        public function get height():uint {
            return _height;
        }
        
        /**
         * The width of the screen.
         */
        public function set height(value:uint):void {
            _height = value;
        }
        
        /**
         * The BitmapData used to draw the screen.
         */
        public function get bitmapData():BitmapData {
            return _bitmapData;
        }
        
        /**
         * The BitmapData used to draw the screen.
         */
        public function set bitmapData(value:BitmapData):void {
            _bitmapData = value;
        }
    }
}