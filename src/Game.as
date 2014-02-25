package {
	import com.fp.Engine;
	import com.fp.World;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.events.Event;
	import com.fp.Entity;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.ui.Keyboard;
	/**
	 * ...
	 * @author Mattu
	 */
	public class Game extends World {
		private var boardGame:BoardGame;
		private var pauseKey:Boolean;
		
		public function Game() {
			super();
			boardGame = new BoardGame();
			add(boardGame);
		}
		
		override public function update():void {
			super.update();
		}
		
		override public function onKeyDown(e:KeyboardEvent):void {
			switch (e.keyCode) {
				case Keyboard.P :
					if (!pauseKey) {
						Engine.pause = !Engine.pause;
						pauseKey = true;
					}
					break;
				default :
					break;
			}
		}
		
		override public function onKeyUp(e:KeyboardEvent):void {
			switch (e.keyCode) {
				case Keyboard.P :
					pauseKey = false;
					break;
				default :
					break;
			}
		}
		
		override public function onMouseMove(e:MouseEvent):void {
			boardGame.onMouseMove(e);
		}
	}
}
