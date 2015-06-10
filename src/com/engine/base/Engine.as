package com.engine.base {
  import flash.desktop.NativeApplication;
  import flash.display.Sprite;
  import flash.display.StageAlign;
  import flash.display.StageScaleMode;
  import flash.events.Event;
  import flash.events.KeyboardEvent;
  import flash.ui.Multitouch;
  import flash.ui.MultitouchInputMode;
  
  /**
   * Main class should extends this to make an Engine.
   * @author Thibaud
   */
  public class Engine extends Sprite {
    /**
     * The width supported by the engine.
     */
    private var _width:uint;
    
    /**
     * The height supported by the engine.
     */
    private var _height:uint;
    
    /**
     * The frame per seconds supported by the engine (must be > 0).
     */
    private var _fps:uint;
    
    /**
     * The counter of the current frame (between 1 and <code>_fps<code>).
     */
    private var _countFrame:uint;
    
    /**
     * The current time (in seconds) of the engine.
     */
    private var _time:uint;
    
    /**
     * Allow the engine to go frame per frame by pressing any touch.
     */
    private var _waitInput:Boolean;
    
    /**
     * The current screen used by the engine.
     */
    protected var _screen:Screen;
    
    /**
     * Allow the engine to go frame per frame by pressing any touch.
     */
    protected var debugMode:Boolean;
    
    /**
     * Allow console information.
     */
    protected var displayDebug:Boolean;
    
    /**
     * Constructor.
     */
    public function Engine(width:uint, height:uint, fps:uint) {
      super();
      _width = width;
      _height = height;
      _fps = fps;
      
      // Settings.
      stage.scaleMode = StageScaleMode.NO_SCALE;
      stage.align = StageAlign.TOP_LEFT;
      Multitouch.inputMode = MultitouchInputMode.TOUCH_POINT;
      
      // EventListeners.
      stage.addEventListener(Event.DEACTIVATE, deactivate);
      stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
      stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
      stage.addEventListener(Event.ENTER_FRAME, onEnterFrame);
    }
    
    /**
     * Fired every frame.
     */
    private function onEnterFrame(e:Event):void {
      if (!debugMode || debugMode && _waitInput) {
        _waitInput = false;
        
        if (displayDebug) {
          _countFrame++;
          if (_countFrame > _fps) {
            _countFrame = 1;
          }
          trace("currentFrame = " + _countFrame);
          for (var i:uint = 0; i < screen._entities.length; ++i) {
            trace(screen._entities[i] + "(" + screen._entities[i].x + "; " + screen._entities[i].y + ")");
          }
        }
        update();
        render();
        draw();
      }
    }
    
    /**
     * Fired when the app deactivate.
     */
    private function deactivate(e:Event):void {
      // make sure the app behaves well (or exits) when in background
      NativeApplication.nativeApplication.exit();
    }
    
    /**
     * Update function.
     */
    private function update():void {
      if (screen) {
        screen.update();
      }
    }
    
    /**
     * Render function.
     */
    private function render():void {
      if (screen) {
        screen.render();
      }
    }
    
    /**
     * Draw stuff on the screen.
     */
    private function draw():void {
      if (screen) {
        
        screen.clear();
        screen.draw();
        
        graphics.clear();
        graphics.beginBitmapFill(screen.bitmapData);
        graphics.drawRect(0, 0, _width, _height);
        graphics.endFill();
      }
    }
    
    /**
     * Fired when a key is released.
     */
    private function onKeyUp(e:KeyboardEvent):void {
      _waitInput = true;
    }
    
    /**
     * Fired when a key is pushed.
     */
    private function onKeyDown(e:KeyboardEvent):void {
    
    }
    
    /**
     * The screen of the engine.
     */
    public function get screen():Screen {
      return _screen;
    }
    
    /**
     * The screen of the engine.
     */
    public function set screen(screen:Screen):void {
      _screen = screen;
      _screen.engine = this;
    }
    
    /**
     * (read only) The current time (in ms) of the engine.
     */
    public function get time():uint {
      return _time * 1000 + _countFrame * 1000 / _fps;
    }
    
    /**
     * (read only) The width supported by the engine.
     */
    override public function get width():Number {
      // We don't want to super.width() here.
      return _width;
    }
    
    /**
     * (read only) The height supported by the engine.
     */
    override public function get height():Number {
      // We don't want to super.height() here.
      return _height;
    }
  }
}