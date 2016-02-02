package com.splashEngine.game.entity {
    import com.splashEngine.engine.entities.Map;
    import com.splashEngine.game.entity.tile.TileBlock;
    import com.splashEngine.game.entity.tile.TileEmpty;
    
    /**
     * Defines a tiled base Map.
     *
     * @author MattuTyson
     */
    public class MapGame extends Map {
        /**
         * The tileMap (in id).
         */
        private var _tileMap:Array = [[1, 1, 1, 1, 1], [1, 0, 0, 0, 1], [1, 0, 0, 0, 1], [1, 0, 0, 0, 1], [1, 1, 1, 1, 1]];
        
        /**
         * Constructor.
         */
        public function MapGame() {
            super();
            
            widthTile = 10;
            heightTile = 10;
            hashMap[0] = TileEmpty;
            hashMap[1] = TileBlock;
            tileMap = convert(_tileMap);
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