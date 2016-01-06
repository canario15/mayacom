$(document).ready(function () {
  $("#accordion > li > div").click(function(){

    if(false == $(this).next().is(':visible')) {
      //$('#accordion ul').slideUp(300);
      $(this).find("i").replaceWith( "<i class='fa fa-caret-down fa-lg'></i>" );
    }else{
      $(this).find("i").replaceWith( "<i class='fa fa-caret-right fa-lg'></i>" );
    }
    $(this).next().slideToggle(300);

  });
  $('#accordion ul:eq(0)').show();

});