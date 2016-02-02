package com.splashEngine.engine {
    
    /**
     * The <code>BaseClass</code> cash properties and methods within the framework.
     *
     * @author MattuTyson
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
            // TODO : may want to force implementing methods (see import flash.utils.describeType).
        }
    }
}