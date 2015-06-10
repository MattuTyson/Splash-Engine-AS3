package entity.tile {
  import com.engine.extended.Tile;
  import flash.display.BitmapData;
  import flash.display.Shape;
  
  /**
   * Define a block tile.
   * @author Thibaud
   */
  public class TileBlock extends Tile {
    
    /**
     * Constructor.
     */
    public function TileBlock(width:uint = 10, height:uint = 10) {
      super();
      this.width = width;
      this.height = height;
      
      bitmapData = new BitmapData(width, height, true, 0x000000);
      var shape:Shape = new Shape();
      shape.graphics.beginFill(0x102020);
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