package com.engine.base {
	import flash.display.BitmapData;
	import flash.geom.Matrix;
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
		 * The BitmapData used to draw the entity.
		 */
		private var _bitmapData:BitmapData;
		
		/**
		 * The boolean used to recreate the <code>BitmapData</code> when needed.
		 */
		private var _invalidateBitmapData:Boolean;
		
		/**
		 * The entity's coordinates (x; y).
		 */
		public var point:Point;
		
		/**
		 * Constructor.
		 */
		public function Entity() {
			super();
			
			// Initialization.
			point = new Point(_x, _y);
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
			if (_invalidateBitmapData) {
				scale(_bitmapData, width, height);
				_invalidateBitmapData = false;
			}
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
			_invalidateBitmapData = true;
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
			_invalidateBitmapData = true;
		}
		
		/**
		 * The BitmapData used to draw the entity.
		 */
		public function get bitmapData():BitmapData {
			if (_invalidateBitmapData) {
				scale(_bitmapData, width, height);
				_invalidateBitmapData = false;
			}
			return _bitmapData;
		}
		
		/**
		 * The BitmapData used to draw the entity.
		 */
		public function set bitmapData(value:BitmapData):void {
			this._bitmapData = value;
		}
		
		/**
		 * Scale the bitmapData.
		 */
		private function scale(bitmapData:BitmapData, width:uint, height:uint):void {
			if (bitmapData.width != width && bitmapData.height != height) {
				var scaleWidth:Number = width / this.width;
				var scaleHeight:Number = height / this.height;
				var bm:BitmapData = bitmapData;
				bitmapData = new BitmapData(bm.width * scaleWidth, bm.height * scaleHeight, true, 0x000000);
				var matrix:Matrix = new Matrix();
				matrix.scale(scaleWidth, scaleHeight);
				bitmapData.draw(bm, matrix, null, null, null, true);
			}
		}
	}
}