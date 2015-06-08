package {
	import flash.display.Shape;
	import Framework.Entity;
	
	/**
	 * Creates platform.
	 * @author Mattu
	 */
	public class Platform extends Entity {
		
		/**
		 * Constructor.
		 */
		public function Platform(x:int = 0, y:int = 0) {
			super();
			this.x = x;
			this.y = y;
		}
		
		override public function render():void {
			super.render();
			
			var shape:Shape = new Shape();
			shape.graphics.beginFill(0xffffff);
			shape.graphics.drawRect(0, 0, width, height);
			shape.graphics.endFill();
			bitmapData.draw(shape);
		}
	}
}