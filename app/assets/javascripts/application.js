// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.min
//= require jquery_ujs
//= require jquery-ui
//= require easing
//= jquery.flexslider
//= move-top
//= require jquery-ui
//= require bootstrap-sprockets
//= require jquery.validate

$(document).ready(function($) {

  $("#rooms-availability").validate({
    rules: {
      check_in: "required",
      check_out: "required"
    },
    messages: {
      check_in: "Please enter check in date",
      check_out: "Please enter check out date"
    }
  });

  $('.room-booking').validate({
    rules: {
      "booking[start_date]": "required",
      "booking[last_date]": "required"
    },
    messages: {
      "booking[start_date]": "Please enter check in date",
      "booking[last_date]": "Please enter check out date"
    }
  });

  $('.new_user').validate();

  $(window).load(function(){
    $('.flexslider').flexslider({
      animation: "slide",
      directionNav : false,
      slideshowSpeed: 10000,
      mousewheel: true,
      start: function(slider){
        $('body').removeClass('loading');
      }
    });
  });
});