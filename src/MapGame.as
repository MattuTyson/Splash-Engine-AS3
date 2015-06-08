package {
	import flash.utils.Dictionary;
	import Framework.Map;
	import Framework.Tile;

	/**
	 * The game map.
	 * @author Thibaud
	 */
	public class MapGame extends Map {
		private var _hashMap:Dictionary;
		private var _tileMap:Array = [[1, 1, 1, 1, 1],
									  [1, 0, 0, 0, 1],
									  [1, 0, 0, 0, 1],
									  [1, 0, 0, 0, 1],
									  [1, 1, 1, 1, 1]];
		
		/**
		 * Constructor.
		 */
		public function MapGame() {
			super();
			_hashMap = new Dictionary();
			_hashMap[0] = TileEmpty;
			_hashMap[1] = TileBlock;
			tileMap = convert(_tileMap);
		}
		
		/**
		 * Fired every frame.
		 * Computes stuff.
		 */
		override public function update():void {
			super.update();
		}
		
		/**
		 * Fired every frames.
		 * Renders stuff.
		 */
		override public function render():void {
			super.render();
			
		}
		
		private function convert(array:Array):Array {
			var returnedArray:Array = new Array();
			for (var i:uint = 0; i < array.length; ++i) {
				returnedArray.push(new Array());
				for (var j:uint = 0; j < array[i].length; ++j) {
					var currentTile:Tile = new _hashMap[array[i][j]]();
					currentTile.point.x = j * currentTile.width;
					currentTile.point.y = i * currentTile.height;
					returnedArray[i].push(currentTile);
				}
			}
			return returnedArray;
		}
	}
}