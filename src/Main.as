package {
	import com.fp.Engine;
	import flash.events.Event;
	
	/**
	 * ...
	 * @author Mattu
	 */
	
	public class Main extends Engine {
		
		public function Main() {
			super(640, 480, 30);
			add(new Game());
		}
	}
}