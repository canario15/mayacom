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

});

