package {
	import Framework.Engine;
	
	/**
	 * ...
	 * @author Thibaud
	 */
	public class Main extends Engine {
		
		public function Main() {
			// Size : iPod (320 * 480).
			super(320, 480, 30);
			
			// Debug Mode
			debugMode = true;
			displayDebug = true;
			
			// First screen.
			screen = new ScreenTitle();
		}
	}
}