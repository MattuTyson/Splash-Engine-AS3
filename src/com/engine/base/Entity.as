package com.engine.base {
	import flash.display.BitmapData;
	import flash.geom.Point;
	
	/**
	 * Entity class.
	 * Define a graphical entity.
	 * @author Thibaud
	 */
	public class Entity extends BaseClass {
		/**
		 * The entity's x position.
		 */
		private var _x:int;
		
		/**
		 * The entity's y position.
		 */
		private var _y:int;
		
		/**
		 * The entity's width.
		 */
		private var _width:uint;
		
		/**
		 * The entity's height.
		 */
		private var _height:uint;
		
		/**
		 * The entity's coordinates (x; y).
		 */
		public var point:Point
		
		/**
		 * The BitmapData used to draw the entity.
		 */
		public var bitmapData:BitmapData;
		
		/**
		 * Constructor.
		 */
		public function Entity(width:uint = 10, height:uint = 10) {
			this._width = width;
			this._height = height;
			
			// Initialization.
			point = new Point(_x, _y);
			bitmapData = new BitmapData(width, height, true, 0x000000);
		}
		
		/**
		 * Fired when the entity needs to update.
		 * Override this.
		 */
		public function update():void {
		
		}
		
		/**
		 * Fired when the entity needs to render.
		 * Override this.
		 */
		public function render():void {
		
		}
		
		/**
		 * The collision function.
		 * Return true if the hitbox of the entities overlaps,
		 * false otherwise.
		 */
		public function isColliding(entity:Entity):Boolean {
			var returnedVariable:Boolean = false;
			if (x + width > entity.x && x < entity.x + entity.width &&
				y + height > entity.y && y < entity.y + entity.height) {
				returnedVariable = true;
			}
			return returnedVariable;
		}
		
		/**
		 * The entity's x position.
		 */
		public function get x():int {
			return _x;
		}
		
		/**
		 * The entity's x position.
		 */
		public function set x(value:int):void {
			point.x = value;
			_x = value;
		}
		
		/**
		 * The entity's y position.
		 */
		public function get y():int {
			return _y;
		}
		
		/**
		 * The entity's y position.
		 */
		public function set y(value:int):void {
			point.y = value;
			_y = value;
		}
		
		/**
		 * The entity's width.
		 */
		public function get width():uint {
			return _width;
		}
		
		/**
		 * The entity's width.
		 */
		public function set width(value:uint):void {
			_width = value;
			bitmapData = new BitmapData(width, height, true, 0x000000);
		}
		
		/**
		 * The entity's height.
		 */
		public function get height():uint {
			return _height;
		}
		
		/**
		 * The entity's height.
		 */
		public function set height(value:uint):void {
			_height = value;
			bitmapData = new BitmapData(width, height, true, 0x000000);
		}
	}
}