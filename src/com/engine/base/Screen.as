package com.engine.base {
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import com.engine.base.Engine;
	import com.engine.base.Entity;
	
	/**
	 * Screen class.
	 * Define a way to compute and draw stuff according to an <code>Engine</code>.
	 * @author Thibaud
	 */
	public class Screen extends BaseClass { // extends EventDispatcher to delete engine variable
		/**
		 * The width of the screen.
		 */
		private var _width:uint;
		
		/**
		 * The height of the screen.
		 */
		private var _height:uint;
		
		/**
		 * The Engine associated to the screen.
		 * You should never modify this.
		 * It is automatically updated after the constructeur.
		 */
		protected var _engine:Engine;
		
		/**
		 * The BitmapData used to draw the screen.
		 */
		protected var _bitmapData:BitmapData;
		
		/**
		 * The Rectangle (width x height) of the screen.
		 */
		protected var _rectangle:Rectangle;
		
		/**
		 * The array of entities.
		 */
		public var _entities:Array;
		
		/**
		 * Constructor.
		 */
		public function Screen() {
			_entities = new Array();
		}
		
		/**
		 * Fired when the engine variable is created.
		 */
		protected function created():void {
			this.bitmapData = new BitmapData(_engine.width, _engine.height, false, 0x000000);
			_rectangle = new Rectangle(0, 0, _engine.width, _engine.height);
		}
		
		/**
		 * Fired every frame.
		 * Override this when you need to compute stuff.
		 */
		public function update():void {
			for each (var entity:Entity in _entities) {
				entity.update();
			}
		}
		
		/**
		 * Fired every frames.
		 * Override this when you need to render stuff.
		 */
		public function render():void {
			for each (var entity:Entity in _entities) {
				entity.render();
			}
		}
		
		/**
		 * Fired at the very end of every frame.
		 * Draw every entities (that may have been updated and rendered) onto the screen.
		 */
		public function draw():void {
			for each (var entity:Entity in _entities) {
				bitmapData.copyPixels(entity.bitmapData, entity.bitmapData.rect, entity.point);
			}
		}
		
		/**
		 * Clear the screen.
		 */
		public function clear():void {
			bitmapData.fillRect(_rectangle, 0x000000);
		}
		
		/**
		 * Add a reference of an entity into the screen.
		 * Allows us to call the <code>update</code> and <code>render</code> methods in Entity.
		 * @param entity the entity you want to add to the screen.
		 */
		public function add(entity:Entity):void {
			_entities.push(entity);
		}
		
		/**
		 * Change the current screen with an other one.
		 * @param screen the new screen you want to set.
		 */
		protected function changeScreen(screen:Screen):void {
			if (!_engine) {
				throw new Error("You can not change the screen in constructor. Change it in an override of the created() function instead.");
			}
			engine.screen = screen;
		}
		
		/**
		 * The Engine associated to the screen.
		 * You should never modify this.
		 * It is automatically updated after the constructeur.
		 */
		public function get engine():Engine {
			return _engine;
		}
		
		/**
		 * The Engine associated to the screen.
		 * You should never modify this.
		 * It is automatically updated after the constructeur.
		 */
		public function set engine(value:Engine):void {
			var isCreated:Boolean = _engine == null;
			_engine = value;
			setWidth(_engine.width);
			setHeight(_engine.height);
			if (isCreated) {
				created();
			}
		}
		
		/**
		 * The BitmapData used to draw the screen.
		 */
		public function get bitmapData():BitmapData {
			return _bitmapData;
		}
		
		/**
		 * The BitmapData used to draw the screen.
		 */
		public function set bitmapData(value:BitmapData):void {
			_bitmapData = value;
		}
		
		/**
		 * The width of the screen.
		 */
		public function get width():uint {
			return _width;
		}
		
		/**
		 * The width of the screen.
		 * TODO : #Cheat can't make a proper setter since it already exist in the superclass.
		 */
		private function setWidth(value:Number):void {
			_width = value;
		}
		
		/**
		 * The width of the screen.
		 */
		public function get height():uint {
			return _height;
		}
		
		/**
		 * The width of the screen.
		 * TODO : #Cheat can't make a proper setter since it already exist in the superclass.
		 */
		private function setHeight(value:Number):void {
			_height = value;
		}
	}
}