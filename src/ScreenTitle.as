package {
	import Framework.Screen;
	
	/**
	 * ...
	 * @author Thibaud
	 */
	public class ScreenTitle extends Screen {
		
		public function ScreenTitle() {
			super();
		}
		
		override protected function created():void {
			super.created();
			changeScreen(new ScreenGame());
		}
		
		override public function update():void {
			super.update();
		}
		
		override public function render():void {
			super.render();
		}
	}
}