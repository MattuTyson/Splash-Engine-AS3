package {
	import com.engine.base.Engine;
	import screen.ScreenTitle;
	
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
			debugMode = true;
			displayDebug = false;
			
			// First screen.
			screen = new screen.ScreenTitle();
		}
	}
}
