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
//= require jquery_ujs
//= require turbolinks
//= require accordion
//= require bxslider.min
//= require icheck
//= require jquery.easing.1.3.min
//= require jquery.sticky
//= require main
//= require owl.carousel.min
//= require script.slider
//= require bootstrap-slider
//= require jquery.flip



$(document).ready(function () {
  $(".radio-test").iCheck({
    checkboxClass: 'icheckbox_flat-blue',
    radioClass: 'iradio_flat-blue'
  });

  $("#ex2").slider({
    formatter: function formatter(val) {
      if (Array.isArray(val)) {
        $(".slide-1").text("$"+ val[0]);
        $(".slide-2").text("$"+ val[1]);
        return val[0] + " : " + val[1];
      } else {
        return val;
      }
    },
  });

  $(".card").flip({
    axis: "y", // y or x
    reverse: false, // true and false
    trigger: "hover", // click or hover
    speed: 500
  });
});