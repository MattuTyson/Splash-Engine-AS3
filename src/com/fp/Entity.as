package com.fp {
	import com.fp.Engine;
	import flash.display.BitmapData;
	import flash.display.Shape;
	import flash.geom.Point;
	import flash.geom.Rectangle;
	/**
	 * ...
	 * @author Mattu
	 */
	public class Entity {
		public var x:Number;
		public var y:Number;
		public var color:Number;
		public var entities:Array;
		protected var hitbox:Rectangle;
		protected var graphics:BitmapData;
		
		public function Entity(x:Number = 0, y:Number = 0, graphics:BitmapData = null, hitbox:Rectangle = null) {
			this.x = x;
			this.y = y;
			entities = new Array();
			if (graphics) this.graphics = graphics;
			else this.graphics = new BitmapData(Engine.WIDTH, Engine.HEIGHT, true, 0x000000);
			if (hitbox) this.hitbox = hitbox;
			else this.hitbox = new Rectangle(x, y, this.graphics.width, this.graphics.height);
		}
		
		public function update():void {
			Engine.point.x = x;
			Engine.point.y = y;
			Engine.screen.copyPixels(graphics, graphics.rect, Engine.point);
			for each (var e:Entity in entities) {
				e.update();
			}
		}
		
		public function drawFillRect(x:Number, y:Number, width:Number, height:Number):void {
			Engine.shape.graphics.clear();
			Engine.shape.graphics.beginFill(color);
			Engine.shape.graphics.drawRect(x, y, width, height);
			Engine.shape.graphics.endFill();
			hitbox.x = x;
			hitbox.y = y;
			hitbox.width = width;
			hitbox.height = height;
			draw();
		}
		
		public function draw():void {
			if (graphics) graphics.draw(Engine.shape);
		}
		
		public function collidePoint(point:Point):Boolean {
			trace(point);
			return point.x > x && point.x < hitbox.width && point.y > y && point.y < hitbox.y;
		}
		
		public function add(e:Entity):void {
			e.x += x;
			e.y += y;
			entities.push(e);
		}
	}
}