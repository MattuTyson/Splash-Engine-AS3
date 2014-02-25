package com.fp {
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.display.Sprite;
	import flash.display.Graphics;
	import flash.display.StageScaleMode;
	import flash.display.StageDisplayState;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.events.MouseEvent;
	import flash.geom.Point;
	/**
	 * ...
	 * @author Mattu
	 *
	 * Todo : avoir une console
	 * modifier le jeu in game et relancer le jeu
	 * zoomer, faire des animations, gérer blur et glow
	 */
	public class Engine extends Sprite {
		public static var FRAME:Number;
		public static var FPS:Number;
		public static var WIDTH:Number;
		public static var HEIGHT:Number;
		public static var screen:BitmapData;
		public static var blackScreen:BitmapData;
		public static var shape:Shape = new Shape();
		public static var point:Point = new Point();
		public static var pause:Boolean;
		protected var world:World;
		
		public function Engine(width:Number, height:Number, fps:Number) {
			super();
			FPS = fps;
			WIDTH = width;
			HEIGHT = height;
			blackScreen = new BitmapData(width, height, false, 0x000000);
			screen = new BitmapData(width, height, false, 0x000000);
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		// Fired when Engine is created
		protected function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			addChild(new Bitmap(screen));
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
			stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			stage.addEventListener(MouseEvent.MOUSE_WHEEL, onMouseWheel);
			stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
			stage.addEventListener(Event.ENTER_FRAME, update);
		}
		
		// Fired every frame.
		protected function update(e:Event):void {
			if (!Engine.pause) {
				if (FRAME < FPS) FRAME++;
				else FRAME = 1;
				if (world) world.update();
			}
		}
		
		// Fired when a key is pressed.
		protected function onKeyDown(e:KeyboardEvent = null):void {
			if (world) world.onKeyDown(e);
		}
		
		// Fired when a key is released.
		protected function onKeyUp(e:KeyboardEvent = null):void {
			if (world) world.onKeyUp(e);
		}
		
		// Fired when a mouse button is pressed.
		protected function onMouseDown(e:MouseEvent = null):void {
			if (world) world.onMouseDown(e);
		}
		
		// Fired when a mouse button is released.
		protected function onMouseUp(e:MouseEvent = null):void {
			if (world) world.onMouseUp(e);
		}
		
		// Fired when the mouse wheel button is rolling.
		protected function onMouseWheel(e:MouseEvent = null):void {
			if (world) world.onMouseWheel(e);
		}
		
		// Fired when the mouse move.
		protected function onMouseMove(e:MouseEvent = null):void {
			if (world) world.onMouseMove(e);
		}
		
		// Set the world's current Game
		protected function add(world:World):World {
			this.world = world;
			return this.world;
		}
		
		// Allow fullscreen
		protected function fullScreen(border:Boolean):void {
			stage.displayState = StageDisplayState.FULL_SCREEN;
			if (border) stage.scaleMode = StageScaleMode.SHOW_ALL;
			else stage.scaleMode = StageScaleMode.NO_BORDER;
		}
	}
}