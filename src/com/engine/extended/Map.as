package com.engine.extended {
	import com.engine.base.Entity;
	import flash.display.BitmapData;
	import flash.geom.Rectangle;
	import flash.utils.Dictionary;

	/**
	 * A map allows you to create a tile based game.
	 * Manage only rectangular tiles.
	 * TODO : Manage hex tiles.
	 * @author Thibaud
	 */
	public class Map extends Entity {
		/**
		 * Array of tiles (tile map).
		 */
		private var _tileMap:Array;
		
		/**
		 * The maximum width value of a tile.
		 */
		private var _widthTile:uint;
		
		/**
		 * The maximum height value of a tile.
		 */
		private var _heightTile:uint;
		
		/**
		 * The hash map used to correlate an id to a <code>Tile</code> class.
		 */
		protected var hashMap:Dictionary;
		
		/**
		 * Constructor.
		 */
		public function Map() {
			super();
			hashMap = new Dictionary();
			_tileMap = new Array();
		}
		
		/**
		 * @inheritDoc
		 */
		override public function update():void {
			super.update();
		}
		
		/**
		 * @inheritDoc
		 */
		override public function render():void {
			super.render();
			draw();
		}
		
		/**
		 * Draw the tiles onto the map.
		 */
		private function draw():void {
			for (i = 0; i < _tileMap.length; ++i) {
				for (j = 0; j < _tileMap[i].length; ++j) {
					var currentTile:Tile = _tileMap[i][j];
					bitmapData.copyPixels(currentTile.bitmapData, currentTile.bitmapData.rect, currentTile.point);
				}
			}
		}
		
		/**
		 * The function used to convert an id array into a <code>Tile</code> class array.
		 * Associate every id with his <code>Tile</code> class.
		 */
		protected function convert(array:Array):Array {
			var returnedArray:Array = new Array();
			for (i = 0; i < array.length; ++i) {
				returnedArray.push(new Array());
				for (j = 0; j < array[i].length; ++j) {
					var currentTile:Tile = new hashMap[array[i][j]]();
					currentTile.width = _widthTile;
					currentTile.height = _heightTile;
					currentTile.point.x = j * currentTile.width;
					currentTile.point.y = i * currentTile.height;
					returnedArray[i].push(currentTile);
				}
			}
			return returnedArray;
		}
		
		/**
		 * Fired when the tileMap variable changes.
		 */
		private function onChangeTileMap():void {
			// TODO : Clean up.
			width = tileMap.length * _widthTile;
			height = tileMap[0].length * _heightTile;
			bitmapData = new BitmapData(width, height, true, 0x000000);
			
			draw();
		}
		
		/**
		 * Getter on tileMap.
		 */
		protected function get tileMap():Array {
			return _tileMap;
		}
		
		/**
		 * Setter on tileMap.
		 */
		protected function set tileMap(value:Array):void {
			if (this._tileMap != value) {
				this._tileMap = value;
				onChangeTileMap();
			}
		}
		
		/**
		 * The maximum width value of a tile.
		 */
		public function get widthTile():uint {
			return _widthTile;
		}
		
		/**
		 * The maximum width value of a tile.
		 */
		public function set widthTile(value:uint):void {
			_widthTile = value;
		}
		
		/**
		 * The maximum width value of a tile.
		 */
		public function get heightTile():uint {
			return _heightTile;
		}
		
		/**
		 * The maximum width value of a tile.
		 */
		public function set heightTile(value:uint):void {
			_heightTile = value;
		}
	}
}