package Framework {
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import Framework.Engine;
	import Framework.Entity;
	
	/**
	 * ...
	 * @author Thibaud
	 */
	public class Screen { // extends EventDispatcher to delete engine variable
		/**
		 * The Engine associated to the screen.
		 * You should never modified this.
		 * It is automatically updated after the constructeur.
		 */
		protected var _engine:Framework.Engine;
		
		/**
		 * The BitmapData.
		 */
		protected var _bitmapData:BitmapData;
		
		/**
		 * The Rectangle of the screen.
		 */
		protected var _rectangle:Rectangle;
		
		/**
		 * The array of entities.
		 */
		public var _entities:Array;
		
		public function Screen() {
			_entities = new Array();
		}
		
		/**
		 * Fired every frame.
		 * Override this when you need to compute stuff.
		 */
		public function update():void {
		
		}
		
		/**
		 * Fired every frames.
		 * Override this when you need to render stuff.
		 */
		public function render():void {
		
		}
		
		/**
		 * Fired at the very end of every frame.
		 * Draw every entities (that may have been updated and rendered) onto the screen.
		 */
		public function draw():void {
			for each (var entity:Framework.Entity in _entities) {
				bitmapData.copyPixels(entity.bitmapData, entity.bitmapData.rect, entity.point);
			}
		}
		
		public function clear():void {
			bitmapData.fillRect(_rectangle, 0x000000);
		}
		
		/**
		 * Fired when the engine variable is created.
		 */
		protected function created():void {
			this.bitmapData = new BitmapData(_engine.width, _engine.height, false, 0x000000);
			_rectangle = new Rectangle(0, 0, _engine.width, _engine.height);
		}
		
		public function addChild(entity:Framework.Entity):void {
			_entities.push(entity);
		}
		
		protected function changeScreen(screen:Screen):void {
			if (!_engine) {
				throw new Error("You can not change the screen in constructor. Change it in an override of the created() function instead.");
			}
			engine.screen = screen;
		}
		
		public function get bitmapData():BitmapData {
			return _bitmapData;
		}
		
		public function set bitmapData(value:BitmapData):void {
			_bitmapData = value;
		}
		
		public function get engine():Framework.Engine {
			return _engine;
		}
		
		public function set engine(value:Framework.Engine):void {
			var isCreated:Boolean = _engine == null;
			_engine = value;
			if (isCreated) {
				created();
			}
		}
	}
}