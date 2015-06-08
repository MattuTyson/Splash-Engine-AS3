package com.engine.extended {
	import com.engine.base.Entity;
	import flash.geom.Rectangle;

	/**
	 * A map allows you to create a tile based game.
	 * @author Thibaud
	 */
	public class Map extends Entity {
		/**
		 * Array of tiles (tile map).
		 */
		private var _tileMap:Array;
		
		/**
		 * The Rectangle of the map.
		 */
		protected var _rectangle:Rectangle;
		
		/**
		 * Constructor.
		 */
		public function Map() {
			super(200, 200);
			_tileMap = new Array();
			_rectangle = new Rectangle(0, 0, width, height);
		}
		
		/**
		 * Fired every frame.
		 */
		override public function update():void {
			
		}
		
		/**
		 * Fired every frames.
		 */
		override public function render():void {
			draw();
		}
		
		/**
		 * Draw the tiles onto the map.
		 */
		private function draw():void {
			for (var i:uint = 0; i < _tileMap.length; ++i) {
				for (var j:uint = 0; j < _tileMap[i].length; ++j) {
					var currentTile:Tile = _tileMap[i][j];
					bitmapData.copyPixels(currentTile.bitmapData, _rectangle, currentTile.point);
				}
			}
		}
		
		/**
		 * Fired when the tileMap variable changes.
		 */
		private function onChangeTileMap():void {
			draw();
		}
		
		/**
		 * Getter on tileMap
		 */
		protected function get tileMap():Array {
			return _tileMap;
		}
		
		/**
		 * Setter on tileMap
		 */
		protected function set tileMap(value:Array):void {
			if (this._tileMap != value) {
				this._tileMap = value;
				onChangeTileMap();
			}
		}
	}
}