package com.splashEngine.game.entity {
    import com.splashEngine.engine.entities.Sprite;
    import flash.display.BitmapData;
    import flash.display.Shape;
    import com.splashEngine.engine.entities.Entity;
    
    /**
     * Defines a platform.
     *
     * @author MattuTyson
     */
    public class Platform extends Sprite {
        
        /**
         * Constructor.
         */
        public function Platform(x:int = 0, y:int = 0, width:uint = 100, height:uint = 20) {
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