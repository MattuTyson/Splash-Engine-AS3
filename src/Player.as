package {
	import flash.display.Shape;
	import Framework.Entity;
	
	/**
	 * ...
	 * @author Thibaud
	 */
	public class Player extends Entity {
		
		public function Player(x:int = 0, y:int = 0, width:uint = 10, height:uint = 10) {
			super(width, height);
			this.x = x;
			this.y = y;
			
			var shape:Shape = new Shape();
			shape.graphics.beginFill(0xffffff);
			shape.graphics.drawRect(0, 0, 5, 10);
			shape.graphics.endFill();
			bitmapData.draw(shape);
		}
		
		public function update():void {
			x++;
		}
		
		public function render():void {
		
		}
	}
}