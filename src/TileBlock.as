package {
	import flash.display.Shape;
	import Framework.Tile;

	/**
	 * Define a block tile.
	 * @author Thibaud
	 */
	public class TileBlock extends Tile {
		
		public function TileBlock() {
			super();
			
			var shape:Shape = new Shape();
			shape.graphics.beginFill(0xccccff);
			shape.graphics.drawRect(0, 0, 10, 10);
			shape.graphics.endFill();
			bitmapData.draw(shape);
		}
	}
}