package Framework {
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Thibaud
	 */
	public class Entity {
		private var _x:int, _y:int;
		public var width:uint, height:uint;
		public var point:Point
		public var bitmapData:BitmapData;
		
		public function Entity(width:uint, height:uint) {
			this.width = width;
			this.height = height;
			
			point = new Point(_x, _y);
			bitmapData = new BitmapData(width, height, true, 0x000000);
		}
		
		public function get x():int {
			return _x;
		}
		
		public function set x(value:int):void {
			point.x = value;
			_x = value;
		}
		
		public function get y():int {
			return _y;
		}
		
		public function set y(value:int):void {
			point.y = value;
			_y = value;
		}
	}
}