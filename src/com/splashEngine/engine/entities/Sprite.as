package com.splashEngine.engine.entities {
    import flash.display.BitmapData;
    import flash.geom.Matrix;
    
    /**
     * Defines a graphical entity.
     *
     * @author MattuTyson
     */
    public class Sprite extends Entity {
        /**
         * The <code>BitmapData</code> used to draw the entity.
         */
        private var _bitmapData:BitmapData;
        
        /**
         * Constructor.
         */
        public function Sprite() {
        }
        
        /**
         * Returns a new scaled <code>BitmapData</code>.
         */
        private function scale(bitmapData:BitmapData, width:uint, height:uint):BitmapData {
            if (bitmapData.width != width || bitmapData.height != height) {
                var scaleWidth:Number = width / bitmapData.width;
                var scaleHeight:Number = height / bitmapData.height;
                var bm:BitmapData = bitmapData;
                bitmapData = new BitmapData(bm.width * scaleWidth, bm.height * scaleHeight, true, 0x000000);
                var matrix:Matrix = new Matrix();
                matrix.scale(scaleWidth, scaleHeight);
                bitmapData.draw(bm, matrix, null, null, null, true);
            }
            return bitmapData;
        }
        
        /**
         * The BitmapData used to draw the entity.
         */
        public function get bitmapData():BitmapData {
            return _bitmapData;
        }
        
        /**
         * The BitmapData used to draw the entity.
         */
        public function set bitmapData(value:BitmapData):void {
            _bitmapData = value;
        }
    }
}