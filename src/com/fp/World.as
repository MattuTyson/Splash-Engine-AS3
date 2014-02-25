package com.fp {
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	/**
	 * ...
	 * @author Mattu
	 */
	public class World {
		private var entities:Array;
		
		public function World() {
			entities = new Array();
		}
		
		// Fired every frame
		public function update():void {
			//Screen Refresh.
			Engine.point.x = 0;
			Engine.point.x = 0;
			Engine.screen.copyPixels(Engine.blackScreen, Engine.blackScreen.rect, Engine.point);
			for each (var e:Entity in entities) {
				e.update();
			}
		}
		
		// Fired when a key is pressed.
		public function onKeyDown(e:KeyboardEvent):void {
			
		}
		
		// Fired when a key is released.
		public function onKeyUp(e:KeyboardEvent):void {
			
		}
		
		// Fired when a mouse button is pressed.
		public function onMouseDown(e:MouseEvent):void {
			
		}
		
		// Fired when a mouse button is released.
		public function onMouseUp(e:MouseEvent):void {
			
		}
		
		// Fired when the mouse wheel button is rolling.
		public function onMouseWheel(e:MouseEvent):void {
			
		}
		
		// Fired when the mouse move.
		public function onMouseMove(e:MouseEvent):void {
			
		}
		
		// Use this to add an Entity to the World.
		public function add(e:Entity):void {
			entities.push(e);
		}
	}
}