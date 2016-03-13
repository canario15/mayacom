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
//= require jquery.elevatezoom
//= require woco.accordion.min
//= require cbpFWTabs
//= require horizon-swiper.min
//= require jquery.form.min
//= require jquery.validate.min


$(document).ready(function () {

  setTimeout(function(){  $('.alert').remove();}, 2500);


  $(".radio-test").iCheck({
    checkboxClass: 'icheckbox_flat-yellow',
    radioClass: 'iradio_flat-yellow'
  });

  $("#ex2").slider({
    formatter: function formatter(val) {
      if (Array.isArray(val)) {
        $(".slide-1").text("$"+ val[0]);
        $(".slide-2").text("$"+ val[1]);
        $(".price_1").val(val[0]);
        $(".price_2").val(val[1]);
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


  $(".boxContr").flip({
    axis: "y", // y or x
    reverse: false, // true and false
    trigger: "hover", // click or hover
    speed: 500
  });


  $(".plan-accordion").accordion({
    //whether the first section is expanded or not
    firstChildExpand: false,
    //whether expanding mulitple section is allowed or not
    multiExpand: false,
    //slide animation speed
    slideSpeed: 500,
    //drop down icon
    dropDownIcon: "&#9660",
  });

  $(".accordion-header  ").click(function() {
    if($($(this).siblings()[0]).data("status") == "0"){
      $(this).parent().parent().siblings($('drawer')).css({"display":"none"});
      $($(this).siblings()[0]).data("status", 1);
    }else{
      $(this).parent().parent().siblings($('drawer')).css({"display":"block"});
      $($(this).siblings()[0]).data("status", 0);
    }
  });

  //initiate the plugin and pass the id of the div containing gallery images
  $("#zoom_01").elevateZoom({
    gallery:'gal1_zoom_01',
    galleryActiveClass: 'active_zoom',
    zoomType : "inner",
    cursor: "crosshair",
    imageCrossfade: true
  });

  //pass the images to Fancybox
  $("#zoom_01").bind("click", function(e) {
    var ez = $('#zoom_01').data('elevateZoom');
    $.fancybox(ez.getGalleryList());
    return false;
  });

  $(".arrow-plan").click(function(e) {
    e.preventDefault();
    var plan_id = $(this).data('plan-id');
    var option = $(this).data('option');
    $.ajax({
      type: "GET",
      data: {plan_id: plan_id, option: option },
      url: "/nextorprevplan",
      success: function (data) {
        $("#partial_plan").html(data);

      }
    });
  });

  $("#go_phones").click(function() {
    $('html, body').animate({scrollTop: $(".cels-plan").offset().top}, 2000);
  });


  if ( $( "#phone-tabs" ).length ) {
    new CBPFWTabs( document.getElementById( 'phone-tabs' ) );
  }

  $('input.do-ph-filter').on('ifChecked', function(event){
    $('#filter-phone').ajaxSubmit( {target: '#phone_container', success: updateReference });
  });

  $('input.do-ph-filter').on('ifUnchecked', function(event){
    $('#filter-phone').ajaxSubmit( {target: '#phone_container', success: updateReference });
  });

  $('input.do-acc-filter').on('ifChecked', function(event){
    $('#filter-acc').ajaxSubmit( {target: '#acc_container', success: updateReference });
  });

  $('input.do-acc-filter').on('ifUnchecked', function(event){
    $('#filter-acc').ajaxSubmit( {target: '#acc_container', success: updateReference });
  });

  function updateReference (){
    $(".card").flip({
      axis: "y", // y or x
      reverse: false, // true and false
      trigger: "hover", // click or hover
      speed: 500
    });
  }

  $(".contact-form").validate({
    rules: {
      name: "required",
      tel: "required",
      email: {
        required: true,
        email: true
      },
      message: {
        required: true,
        minlength: 50
      }
    },
    messages: {
      name: "Por favor ingrese su nombre",
      tel: "Por favor ingrese su teléfono",
      email: {
        required: "Por favor ingrese su email",
        minlength: "Por favor ingrese un email válido"
      },
      message: {
        required: "Por favor ingrese mensaje",
        minlength: "Por favor ingrese al menos 50 caracteres"
      }
    }
  });

});

