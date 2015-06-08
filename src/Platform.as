package {
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
		public function Platform(x:int = 0, y:int = 0) {
			super();
			this.x = x;
			this.y = y;
		}
		
		/**
		 * @inheritDoc
		 */
		override public function render():void {
			super.render();
			
			var shape:Shape = new Shape();
			shape.graphics.beginFill(0xFFFFFF);
			shape.graphics.drawRect(0, 0, width, height);
			shape.graphics.endFill();
			bitmapData.draw(shape);
		}
	}
}