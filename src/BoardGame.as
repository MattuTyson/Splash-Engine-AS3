package  {
	import flash.display.Graphics;
	import com.fp.Entity;
	import com.fp.Engine;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mattu
	 */
	public class BoardGame extends Entity {
		private var squares:Array;
		
		public function BoardGame() {
			super();
			color = 0x424242;
			drawFillRect(0, 0, 400, 400);
			x = (Engine.WIDTH - 400) / 2;
			y = (Engine.HEIGHT - 400) / 2;
			squares = new Array();
			for (var j:Number = 0; j < 16; j++) {
				for (var i:Number = 0; i < 16; i++) {
					squares.push(new Square(i * 25 + 2, j * 25 + 2));
					add(squares[i + j * 16]);					
				}
			}
			squares[29].isAlive = true;
			squares[30].isAlive = true;
			squares[31].isAlive = true;
			
			squares[29].isLiving = true;
			squares[30].isLiving = true;
			squares[31].isLiving = true;
			
			
			squares[100].isAlive = true;
			squares[117].isAlive = true;
			squares[131].isAlive = true;
			squares[132].isAlive = true;
			squares[133].isAlive = true;
			
			squares[100].isLiving = true;
			squares[117].isLiving = true;
			squares[131].isLiving = true;
			squares[132].isLiving = true;
			squares[133].isLiving = true;
		}
		
		override public function update():void {
			super.update();
			if (Engine.FRAME == 30 || Engine.FRAME == 15) {
				for (var j:Number = 0; j < 16; j++) {
					for (var i:Number = 0; i < 16; i++) {
						if (isDawning(i, j)) {
							squares[i + j * 16].isLiving = true;
						} else if (isDying(i, j)) {
							squares[i + j * 16].isLiving = false;
						}
					}
				}
			}
		}
		
		public function onMouseMove(e:MouseEvent):void {
			for (var j:Number = 0; j < 16; j++) {
				for (var i:Number = 0; i < 16; i++) {
					if (squares[i + j * 16].collidePoint(new Point(e.target.mouseX,e.target.mouseY))) {
						squares[i + j * 16].selected = true;
					} else {
						squares[i + j * 16].selected = false;
					}
				}
			}
		}
		
		public function isDawning(i:Number, j:Number):Boolean {
			var count:Number = 0;
			for (var jj:Number = -1; jj < 2; jj++) {
				for (var ii:Number = -1; ii < 2; ii++) {
					if (squares[i + ii + (j + jj) * 16]) {
						if (squares[i + ii + (j + jj) * 16].isAlive) {
							count++;
						}
					}
				}
			}
			return count == 3 || count == 4 && squares[i + j * 16].isAlive;
		}
		
		public function isDying(i:Number, j:Number):Boolean {
			return true;
		}
	}
}