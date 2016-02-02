package com.splashEngine.engine.entities {
    import com.splashEngine.engine.BaseClass;
    import flash.display.BitmapData;
    import flash.geom.Matrix;
    import flash.geom.Point;
    
    /**
     * The <code>Entity</code> class.
     * Defines an entity (framework purpose cannot be drawn : memory infos).
     *
     * @author MattuTyson
     */
    public class Entity extends BaseClass {
        /**
         * The entity's coordinates (x; y).
         */
        private var _point:Point;
        
        /**
         * The entity's width.
         */
        private var _width:uint;
        
        /**
         * The entity's height.
         */
        private var _height:uint;
        
        /**
         * Constructor.
         */
        public function Entity() {
            super();
            
            // Initialization.
            _point = new Point(0, 0);
        }
        
        /**
         * Fired when the entity needs to update.
         * Override this.
         */
        public function update():void {
            // Empty at the moment.
        }
        
        /**
         * Fired when the entity needs to render.
         * Override this.
         */
        public function render():void {
            // Empty at the moment.
        }
        
        /**
         * The collision function.
         * Return true if the hitbox of the entities overlaps,
         * false otherwise.
         */
        public function isColliding(entity:Entity):Boolean {
            var returnedVariable:Boolean = false;
            if (x + width > entity.x && x < entity.x + entity.width && y + height > entity.y && y < entity.y + entity.height) {
                returnedVariable = true;
            }
            return returnedVariable;
        }
        
        /**
         * The entity's x position.
         */
        public function get x():int {
            return _point.x;
        }
        
        /**
         * The entity's x position.
         */
        public function set x(value:int):void {
            _point.x = value;
        }
        
        /**
         * The entity's y position.
         */
        public function get y():int {
            return _point.y;
        }
        
        /**
         * The entity's y position.
         */
        public function set y(value:int):void {
            _point.y = value;
        }
        
        /**
         * The entity's coordinates (x; y).
         */
        public function get point():Point {
            return _point;
        }
        
        /**
         * The entity's coordinates (x; y).
         */
        public function set point(value:Point):void {
            _point = value;
        }
        
        /**
         * The entity's width.
         */
        public function get width():uint {
            return _width;
        }
        
        /**
         * The entity's width.
         */
        public function set width(value:uint):void {
            if (_width != value) {
                _width = value;
            }
        }
        
        /**
         * The entity's height.
         */
        public function get height():uint {
            return _height;
        }
        
        /**
         * The entity's height.
         */
        public function set height(value:uint):void {
            if (_height != value) {
                _height = value;
            }
        }
    }
}
