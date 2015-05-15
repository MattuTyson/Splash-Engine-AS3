package {
	import Framework.Screen;
	
	/**
	 * ...
	 * @author Thibaud
	 */
	public class ScreenGame extends Screen {
		/**
		 * The player.
		 */
		private var _player:Player;
		
		/**
		 * Constructor.
		 */
		public function ScreenGame() {
			super();
			
			_player = new Player();
			addChild(_player);
		}
		
		/**
		 * Fired when the screen update.
		 */
		override public function update():void {
			super.update();
			_player.update();
		}
		
		/**
		 * Fired when the screen render.
		 */
		override public function render():void {
			super.render();
			_player.render();
		}
	}
}