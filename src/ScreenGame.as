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
		 * The platforms.
		 */
		private var _platforms:Array;
		
		/**
		 * Constructor.
		 */
		public function ScreenGame() {
			super();
		}
		
		override protected function created():void {
			super.created();
			var i:uint;
			
			// Initialization.
			_player = new Player();
			_player.width = 10;
			_player.height = 10;
			_player.x = (width - _player.width) / 2;
			_player.y = height - _player.height - 100;
			
			_platforms = new Array();
			for (i = 0; i < 5; ++i) {
				var platform:Platform = new Platform();
				platform.width = 100;
				platform.height = 25;
				platform.x = -platform.width / 2 + Math.random() * width;
				platform.y = i * 100;
				_platforms.push(platform);
			}
			
			// Add.
			add(_player);
			for (i = 0; i < _platforms.length; ++i) {
				add(_platforms[i]);
			}
		}
		
		/**
		 * Fired when the screen update.
		 */
		override public function update():void {
			super.update();
			
			_player.y += _player.dy;
			for (var i:uint = 0; i < _platforms.length; ++i) {
				if (_player.downInto(_platforms[i])) {
					_player.y = _platforms[i].y - _player.height;
				}
			}
		}
		
		/**
		 * Fired when the screen render.
		 */
		override public function render():void {
			super.render();
		}
	}
}