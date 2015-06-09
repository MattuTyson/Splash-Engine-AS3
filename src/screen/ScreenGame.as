package screen {
	import entity.MapGame;
	import entity.Platform;
	import entity.Player;
	import flash.filters.DisplacementMapFilter;
	import flash.geom.Point;
	import com.engine.base.Screen;
	
	/**
	 * ScreenGame class.
	 * The screen used to compute and draw the game.
	 * @author Thibaud
	 */
	public class ScreenGame extends Screen {
		/**
		 * The map.
		 */
		private var _map:entity.MapGame;
		
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
		
		/**
		 * @inheritDoc
		 */
		override protected function created():void {
			super.created();
			
			// Initialization.
			_map = new MapGame();
			
			_player = new Player();
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
			add(_map);
			add(_player);
			for (i = 0; i < _platforms.length; ++i) {
				add(_platforms[i]);
			}
		}
		
		/**
		 * @inheritDoc
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
	}
}