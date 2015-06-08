package entity.tile {
	import flash.display.Shape;
	import com.engine.extended.Tile;

	/**
	 * Define an empty tile.
	 * @author Thibaud
	 */
	public class TileEmpty extends Tile {
		
		/**
		 * Constructor.
		 */
		public function TileEmpty() {
			super();
			
			var shape:Shape = new Shape();
			shape.graphics.beginFill(0x1E1E1E);
			shape.graphics.drawRect(0, 0, 10, 10);
			shape.graphics.endFill();
			bitmapData.draw(shape);
		}
	}
}