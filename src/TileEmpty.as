package {
	import flash.display.Shape;
	import Framework.Tile;

	/**
	 * Define an empty tile.
	 * @author Thibaud
	 */
	public class TileEmpty extends Tile {
		
		public function TileEmpty() {
			super();
			
			var shape:Shape = new Shape();
			shape.graphics.beginFill(0xcccccc);
			shape.graphics.drawRect(0, 0, 10, 10);
			shape.graphics.endFill();
			bitmapData.draw(shape);
		}
	}
}