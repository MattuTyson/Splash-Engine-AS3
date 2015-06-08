package entity {
	import flash.display.Shape;
	import com.engine.base.Entity;
	
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
			
			var shape:Shape = new Shape();
			shape.graphics.beginFill(0x1E1E1E);
			shape.graphics.drawRect(0, 0, width, height);
			shape.graphics.endFill();
			bitmapData.draw(shape);
		}
		
		/**
		 * Determinates if the player fall onto an entity.
		 * Return true if the player fall onto the entity,
		 * false otherwise.
		 * TODO : Let's make a generic function the return how the player fall
		 * by returning default values such as DOWN, UP, RIGHT, LEFT...
		 */
		public function downInto(entity:Entity):Boolean {
			return dy > 0 && isColliding(entity);
		}
	}
}