package com.splashEngine.game.entity {
    import com.splashEngine.engine.entities.Entity;
    import com.splashEngine.engine.entities.Sprite;
    import flash.display.BitmapData;
    import flash.display.Shape;
    
    /**
     * Player class.
     *
     * @author MattuTyson
     */
    public class Player extends Sprite {
        /**
         * The x velocity.
         */
        public var dx:int;
        
        /**
         * The y velocity.
         */
        public var dy:int;
        
        /**
         * Constructor.
         */
        public function Player(x:int = 0, y:int = 0, width:uint = 10, height:uint = 10) {
            super();
            this.x = x;
            this.y = y;
            this.width = width;
            this.height = height;
            
            bitmapData = new BitmapData(width, height, true, 0x000000);
            var shape:Shape = new Shape();
            shape.graphics.beginFill(0x1E1E1E);
            shape.graphics.drawRect(0, 0, width, height);
            shape.graphics.endFill();
            bitmapData.draw(shape);
            dy = 1;
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
        
        /**
         * Determinates if the player fall onto an entity.
         * Return true if the player fall onto the entity,
         * false otherwise.
         * TODO : Let's make a generic function the return how the player fall
         * by returning default values such as DOWN, UP, RIGHT, LEFT...
         */
        public function downInto(entity:Entity):Boolean {
            return dy > 0 && isColliding(entity);
        }
    }
}