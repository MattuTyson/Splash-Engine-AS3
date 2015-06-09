package entity {
	import flash.display.BitmapData;
	import flash.display.Shape;
	import com.engine.base.Entity;
	
	/**
	 * Creates platform.
	 * @author Mattu
	 */
	public class Platform extends Entity {
		
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
	}
}