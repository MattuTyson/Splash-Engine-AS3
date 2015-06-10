package entity {
  import com.engine.extended.Map;
  import entity.tile.TileBlock;
  import entity.tile.TileEmpty;
  
  /**
   * The game map.
   * @author Thibaud
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
      
      // if the tile does not mach the size
      // we scale them according to this size.
      widthTile = 10;
      heightTile = 30;
      
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