package {
	import flash.utils.Dictionary;
	import com.engine.extended.Map;
	import com.engine.extended.Tile;

	/**
	 * The game map.
	 * @author Thibaud
	 */
	public class MapGame extends Map {
		/**
		 * The hashMap used to correlate an id to a <code>Tile</code> class.
		 */
		private var _hashMap:Dictionary;
		
		/**
		 * The tileMap (in id).
		 */
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
		
		/**
		 * The function used to convert an id array into a <code>Tile</code> class array.
		 * Associate every id with his <code>Tile</code> class.
		 */
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