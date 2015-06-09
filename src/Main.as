package {
	import com.engine.base.Engine;
	import screen.ScreenTitle;
	
	/**
	 * Main class.
	 * Needs to extends <code>Engine</code> to use the engine.
	 * @author Thibaud
	 */
	public class Main extends Engine {
		
		/**
		 * Main function.
		 */
		public function Main() {
			// Size : iPod (320 * 480) at 30 fps.
			super(320, 480, 30);
			
			// Debug Mode.
			debugMode = false;
			displayDebug = false;
			
			// First screen.
			screen = new ScreenTitle();
		}
	}
}
