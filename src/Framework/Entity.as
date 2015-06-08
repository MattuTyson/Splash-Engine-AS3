package Framework {
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	/**
	 * ...
	 * @author Thibaud
	 */
	public class Entity {
		private var _x:int, _y:int;
		private var _width:uint, _height:uint;
		public var point:Point
		public var bitmapData:BitmapData;
		
		public function Entity(width:uint = 10, height:uint = 10) {
			this._width = width;
			this._height = height;
			
			point = new Point(_x, _y);
			bitmapData = new BitmapData(width, height, true, 0x000000);
		}
		
		public function update():void {
			
		}
		
		public function render():void {
			
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
		
		public function get width():uint {
			return _width;
		}
		
		public function set width(value:uint):void {
			_width = value;
			bitmapData = new BitmapData(width, height, true, 0x000000);
		}
		
		public function get height():uint {
			return _height;
		}
		
		public function set height(value:uint):void {
			_height = value;
			bitmapData = new BitmapData(width, height, true, 0x000000);
		}
		
		public function isColliding(entity:Entity):Boolean {
			var returnedVariable:Boolean = false;
			if (x + width > entity.x &&
				x < entity.x + entity.width &&
				y + height > entity.y &&
				y < entity.y + entity.height)
				returnedVariable = true;
			return returnedVariable;
		}
	}
}