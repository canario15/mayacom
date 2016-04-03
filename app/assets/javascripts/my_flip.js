$(function () {


  if ($('html').hasClass('csstransforms3d')) {

    $('.contr-card').removeClass('scroll').addClass('flip');
    $('.contr-card.flip').hover(
      function () {
        $(this).find('.contr-card-wrapper').addClass('flipIt');
      },
      function () {
        $(this).find('.contr-card-wrapper').removeClass('flipIt');
      }
    );

  } else {

    $('.contr-card').hover(
      function () {
        $(this).find('.contr-card-detail').stop().animate({bottom:0}, 500, 'easeOutCubic');
      },
      function () {
        $(this).find('.contr-card-detail').stop().animate({bottom: ($(this).height() * -1) }, 500, 'easeOutCubic');
      }
    );

  }

});
