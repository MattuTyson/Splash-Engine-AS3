package Framework {
	import flash.desktop.NativeApplication;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.ui.Multitouch;
	import flash.ui.MultitouchInputMode;
	
	/**
	 * Main class should extends this to make an Engine.
	 * @author Thibaud
	 */
	public class Engine extends Sprite {
		private var _width:uint;
		private var _height:uint;
		private var _fps:uint;
		private var _countFrame:uint;
		public var debugMode:Boolean;
		private var _waitInput:Boolean;
		
		/**
		 * The current screen used by the engine.
		 */
		protected var _screen:Screen;
		
		/**
		 * Allow console to be display on screen.
		 */
		public var displayDebug:Boolean;
		
		/**
		 * Constructor.
		 */
		public function Engine(width:uint, height:uint, fps:uint) {
			_width = width;
			_height = height;
			_fps = fps;
			
			// Settings.
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
			
			// EventListeners.
			stage.addEventListener(Event.DEACTIVATE, deactivate);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(Event.ENTER_FRAME, onEnterFrame);
		}
		
		private function onEnterFrame(e:Event):void {
			if (!debugMode || debugMode && _waitInput) {
				_waitInput = false;
				
				draw();
				if (displayDebug) {
					_countFrame++;
					if (_countFrame > _fps) {
						_countFrame = 1;
					}
					trace(_countFrame);
					if (screen._entities[0]) {
						trace(screen._entities[0].x);
					}
				}
				update();
				render();
			}
		}
		
		private function deactivate(e:Event):void {
			// make sure the app behaves well (or exits) when in background
			NativeApplication.nativeApplication.exit();
		}
		
		private function update():void {
			if (screen) {
				screen.update();
			}
		}
		
		private function render():void {
			if (screen) {
				screen.render();
			}
		}
		
		private function draw():void {
			if (screen) {
				
				screen.clear();
				screen.draw();
				
				graphics.clear();
				graphics.beginBitmapFill(screen.bitmapData);
				graphics.drawRect(0, 0, _width, _height);
				graphics.endFill();
			}
		}
		
		private function onKeyUp(e:KeyboardEvent):void {
			_waitInput = true;
		}
		
		private function onKeyDown(e:KeyboardEvent):void {
		
		}
		
		public function set screen(screen:Screen):void {
			_screen = screen;
			_screen.engine = this;
		}
		
		public function get screen():Screen {
			return _screen;
		}
		
		override public function get width():Number {
			return _width;
		}
		
		override public function get height():Number {
			return _height;
		}
	}
}