package {
	import Framework.Engine;
	
	/**
	 * Main class.
	 * @author Thibaud
	 */
	public class Main extends Engine {
		
		/**
		 * Main function.
		 */
		public function Main() {
			// Size : iPod (320 * 480).
			super(320, 480, 30);
			
			// Debug Mode
			debugMode = false;
			displayDebug = false;
			
			// First screen.
			screen = new ScreenTitle();
		}
	}
}
