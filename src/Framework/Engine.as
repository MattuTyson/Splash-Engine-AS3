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
		/**
		 * The width supported by the engine.
		 */
		private var _width:uint;
		
		/**
		 * The height supported by the engine.
		 */
		private var _height:uint;
		
		/**
		 * The frame per seconds supported by the engine (must be > 0).
		 */
		private var _fps:uint;
		
		/**
		 * The counter of the current frame (between 1 and <code>_fps<code>).
		 */
		private var _counterFrame:uint;
		
		/**
		 * The current time (in seconds) of the engine.
		 */
		private var _time:uint;
		
		/**
		 * The current screen used by the engine.
		 */
		protected var _screen:Screen;
		
		/**
		 * Allow the engine to go frame per frame by pressing any touch.
		 */
		public var debugMode:Boolean;
		
		/**
		 * Allow the engine to go frame per frame by pressing any touch.
		 */
		private var _waitInput:Boolean;
		
		/**
		 * Allow console information.
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
				_counterFrame++;
				if (_counterFrame > _fps) {
					_counterFrame = 1;
					++_time;
				}
				if (displayDebug) {
					trace(_counterFrame);
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
		
		/**
		 * (read only) The current time (in ms) of the engine.
		 */
		public function get time():uint {
			return _time * 1000 + _counterFrame * 1000 / _fps;
		}
		
		override public function get width():Number {
			return _width;
		}
		
		override public function get height():Number {
			return _height;
		}
	}
}