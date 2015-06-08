package {
	import flash.display.Shape;
	import com.engine.extended.Tile;

	/**
	 * Define a block tile.
	 * @author Thibaud
	 */
	public class TileBlock extends Tile {
		
		/**
		 * Constructor.
		 */
		public function TileBlock() {
			super();
			
			var shape:Shape = new Shape();
			shape.graphics.beginFill(0xCCCCFF);
			shape.graphics.drawRect(0, 0, 10, 10);
			shape.graphics.endFill();
			bitmapData.draw(shape);
		}
	}
}