package  {
	import com.fp.Entity;
	import com.fp.Engine;
	/**
	 * ...
	 * @author Mattu
	 */
	public class Square extends Entity {
		public var isAlive:Boolean;
		public var isLiving:Boolean;
		public var selected:Boolean;
		
		public function Square(x:Number, y:Number) {
			super(x, y);
			isAlive = false;
			isLiving = false;
			selected = false;
			color = 0x101099;
			drawFillRect(0, 0, 21, 21);
		}
		
		override public function update():void {
			super.update();
			if (selected) {
				color = 0xff5050;
				drawFillRect(0, 0, 21, 21);
			} else if (isLiving) {
				color = 0x5050ff;
				drawFillRect(0, 0, 21, 21);
				isAlive = true;
			} else {
				color = 0x101099;
				drawFillRect(0, 0, 21, 21);
				isAlive = false;
			}
		}
	}
}