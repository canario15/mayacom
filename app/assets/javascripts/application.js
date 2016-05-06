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
//= require cbpFWTabs
//= require countdown
//= require icheck
//= require ion.rangeSlider.min
//= require jquery.sticky
//= require jquery.flip
//= require jquery.form.min
//= require jquery.simpleGallery
//= require jquery.simpleLens.min
//= require jquery.sticky
//= require jquery.validate.min
//= require owl.carousel.min
//= require woco.accordion
//= require chosen.jquery.min
//= require jquery.tooltipster.min

$(document).on('page:change', function() {

  $(".mainmenu-area").sticky({topSpacing:0});

  $('.product-carousel').owlCarousel({
    navText: ['<i class="fa fa-angle-left"></i>',"<i class='fa fa-angle-right'></i>"],
    loop: true,
    nav: true,
    margin: 20,
    responsiveClass: true,
    autoPlay: 2000,
    responsive:{
      0:{
          items:1,
      },
      600:{
          items:3,
      },
      1000:{
          items:5,
      }
    }
  });

  // Bootstrap Mobile Menu fix
  $(".navbar-nav li a").click(function(){
      $(".navbar-collapse").removeClass('in');
  });


  if ( $( "#zoom_gallery" ).length ) {
    $('#zoom_gallery .simpleLens-thumbnails-container img').simpleGallery({
      loading_image: '/loading.gif',
      show_event: 'click'
    });

    $('#zoom_gallery .simpleLens-big-image').simpleLens({
      loading_image: '/loading.gif',
    });
  }

  setTimeout(function(){  $('.alert').remove();}, 2500);

  $(".radio-test").iCheck({
    checkboxClass: 'icheckbox_flat-yellow',
    radioClass: 'iradio_flat-yellow'
  });

  $("#slide-range-price").ionRangeSlider({
    type: "double",
    min: 0,
    max: 65000,
    from: 0,
    to: 65000,
    prefix: "$",
    onChange: function (data) {
      $(".price_1").val(data.from);
      $(".price_2").val(data.to);
      $(".slide-1").text("$"+ data.from);
      $(".slide-2").text("$"+ data.to);
    },
    onFinish: function (data) {
      $("#submit_filter").click();
    }
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

  $(".accordion-header ").click(function() {
    if($($(this).siblings()[0]).data("status") == "0"){
      $(this).parent().parent().siblings($('drawer')).css({"display":"none"});
      $($(this).siblings()[0]).data("status", 1);
    }else{
      $($(this).siblings()[0]).data("status", 0);
    }
  });

  $("#go_phones").click(function() {
    $('html, body').animate({scrollTop: $(".cels-plan").offset().top}, 2000);
  });

  if ( $( "#phone-tabs" ).length ) {
    new CBPFWTabs( document.getElementById( 'phone-tabs' ) );
  }

  $('input.do-ph-filter').on('ifChecked', function(event){
    $("#submit_filter").click();
  });

  $('input.do-ph-filter').on('ifUnchecked', function(event){
    $("#submit_filter").click();
  });

  $('input.do-acc-filter').on('ifChecked', function(event){
    $("#submit_filter").click();
  });

  $('input.do-acc-filter').on('ifUnchecked', function(event){
    $("#submit_filter").click();
  });


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

  $('#bxslider-home4').bxSlider({
    nextText:'<i class="fa fa-angle-right"></i>',
    prevText:'<i class="fa fa-angle-left"></i>',
    auto: true,
    onSliderLoad:function(currentIndex){
        $('#bxslider-home4 li').find('.caption').each(function(i){
            $(this).show().addClass('animated fadeInRight').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
                $(this).removeClass('fadeInRight animated');
            });
        })
    },
    onSlideBefore:function(slideElement, oldIndex, newIndex){
        slideElement.find('.sl-description').hide();
        slideElement.find('.caption').each(function(){
           $(this).hide().removeClass('animated fadeInRight');
        });
    },
    onSlideAfter: function(slideElement, oldIndex, newIndex){
        slideElement.find('.sl-description').show();
        setTimeout(function(){
            slideElement.find('.caption').each(function(){
               $(this).show().addClass('animated fadeInRight').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
                    $(this).removeClass('fadeInRight animated');
                });
            });
        }, 500);
    }
  });

  $('.sel-comp-phone').chosen({
    allow_single_deselect: true,
    no_results_text: "no hay resultados",
    placeholder_text_single: "Selecione un teléfono",
    width: "80%"
  });

  $('.sel-comp-phone').chosen().change(function(){
    var phone_id = $(this).chosen().val();
    var phone_table = $(this).data('phone');
    $.ajax({
      method: "GET",
      url: "/spec_comp",
      data: { phone_id: phone_id }
    }).done(function( data ) {
      $('#'+ phone_table).html(data);
      if(phone_table == 'phone_1'){
        var scr = $('#src_image_photo_'+phone_id).val();
        $('#photo_image_1').html("<img src="+ scr+" class='cel-img-comp'>")
      }else{
        if(phone_table == 'phone_2'){
          var scr = $('#src_image_photo_'+phone_id).val();
          $('#photo_image_2').html("<img src="+ scr+" class='cel-img-comp'>")
        }
      }
    });
  });

  $(".btn-coso").click(function(){
    var contract_id = $(this).data('contract-id');
    var phone_id = $(this).data('phone-id');
    $(".btn-coso-active").removeClass("btn-coso-active");
    $(this).addClass("btn-coso-active");
    $.ajax({
      method: "GET",
      url: "/contracts_plans",
      data: { contract_id: contract_id, phone_id: phone_id }
    }).done(function( data ) {
      $(".plan-list").html(data);
    });
  });

  $('.contr-card-wrapper').hover(function(){
    $(this).addClass('flip');
  },function(){
    $(this).removeClass('flip');
  });


});

/*
$(document).on('page:fetch', function() {
  $(".loading-indicator").show();
});
$(document).on('page:change', function() {
  $(".loading-indicator").hide();
});*/



