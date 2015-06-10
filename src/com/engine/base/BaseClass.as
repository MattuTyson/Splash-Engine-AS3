package com.engine.base {
  
  /**
   * The BaseClass allows us to cheat within the framework.
   * @author Thibaud
   */
  public class BaseClass {
    /**
     * The i variable is often used in 1D <code>for</code> loops.
     */
    protected var i:uint;
    
    /**
     * The j variable is often used in 2D <code>for</code> loops.
     */
    protected var j:uint;
    
    /**
     * Constructor.
     */
    public function BaseClass() {
      i = 0;
      j = 0;
      // You may want to use this to force implementing some methods.
      //import flash.utils.describeType;
    }
  }
}