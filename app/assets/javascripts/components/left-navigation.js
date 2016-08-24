//dependency: bootstrap, select2, timepicker, momentjs

(function($){
	"use strict";

	// DELAYPICKER PUBLIC CLASS DEFINITION
  	var LeftNavigation = function(element, options) {
  		//#TODO - split options into a separate and restrictive set.
  		this.options = options;
  		this.$element = $(element);
  		this._init();
  	}

  	LeftNavigation.prototype = {
  		// write all functions here

	    constructor: LeftNavigation,

	    _init: function(){
	    	var self = this;
	    	self.$element.wrap('<div class="delay-container form-inline"></div>');
			self.$element.addClass("delaypicker").addClass("hidden");
		    return self.$element;
	    },

	    reset: function() {
	    	var el = this.$element;
	    	var parent = el.parent();
	    	parent.find('input[name="entity-prev-val"]').val("0");
	    	parent.find('select[name="entity"]').select2("val", "days");
	    	parent.find('select[name="entity"]').trigger('change');
	    }
	}

	//delaypicker plugin definition
    $.fn.left_navigation = function(option) {
    	var args = Array.apply(null, arguments);
    	args.shift();
    	return this.each(function() {
    		var $this = $(this),
    		data = $this.data('delaypicker'),
	        options = typeof option === 'object' && option;
	        if(!data){
	        	$this.data('delaypicker', (data = new Delaypicker(this, options)));	
	        }
	        if(typeof option === 'string'){
		    	data[option].apply(data, args);
		    }
    	});
    };
    $.fn.left_navigation.Constructor = LeftNavigation;
}(jQuery));