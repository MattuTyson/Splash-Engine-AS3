package {
	import flash.filters.DisplacementMapFilter;
	import flash.geom.Point;
	import Framework.Screen;
	
	/**
	 * ...
	 * @author Thibaud
	 */
	public class ScreenGame extends Screen {
		/**
		 * The map.
		 */
		private var _map:MapGame;
		
		 /**
		 * The player.
		 */
		private var _player:Player;
		
		/**
		 * Constructor.
		 */
		public function ScreenGame() {
			super();
			
			_map = new MapGame();
			_player = new Player();
			addChild(_map);
			addChild(_player);
		}
		
		/**
		 * Fired when the screen update.
		 */
		override public function update():void {
			super.update();
			_player.update();
			_map.update();
		}
		
		/**
		 * Fired when the screen render.
		 */
		override public function render():void {
			super.render();
			_player.render();
			_map.render();
		}
	}
}