package {
	import flash.display.Shape;
	import Framework.Entity;
	
	/**
	 * Player class.
	 * @author Thibaud
	 */
	public class Player extends Entity {
		/**
		 * The x velocity.
		 */
		public var dx:int;
		
		/**
		 * The y velocity.
		 */
		public var dy:int;
		
		/**
		 * Constructor.
		 */
		public function Player(x:int = 0, y:int = 0) {
			super();
			this.x = x;
			this.y = y;
			dy = 1;
		}
		
		override public function update():void {
			super.update();
		}
		
		override public function render():void {
			super.render();
			
			var shape:Shape = new Shape();
			shape.graphics.beginFill(0xffffff);
			shape.graphics.drawRect(0, 0, width, height);
			shape.graphics.endFill();
			bitmapData.draw(shape);
		}
		
		public function downInto(entity:Entity):Boolean {
			return dy > 0 && isColliding(entity);
		}
	}
}