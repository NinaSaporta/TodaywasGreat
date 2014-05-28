
$(document).ready(function(){


  $(".accountInfo").click(function() {
    $(".userInfo").slideToggle( "slow");
  });
  
  $(".notifications").click(function() {
    $(".notificationsDrop").slideToggle( "slow");
  });
  
  $(".myposts").click(function() {
    $(".mypostsdrop").slideToggle( "slow");
  });
  
  $(".navSquares").click(function() {
    $(".navMenuHidePages").slideToggle( "slow");
  });

  $(".navSquares").click(function() {
    $(".navMenuHide").slideToggle( "slow");
  });

  if (!diamondbackground2.svg) {
  $('img[src$=".svg"]').each(function() {
    $(this).attr('src', $(this).attr('src').replace('.svg', '.png'));
  });
}

 if (!twglogo.svg) {
  $('img[src$=".svg"]').each(function() {
    $(this).attr('src', $(this).attr('src').replace('.svg', '.png'));
  });
}

if (!whatmadebanner.svg) {
  $('img[src$=".svg"]').each(function() {
    $(this).attr('src', $(this).attr('src').replace('.svg', '.png'));
  });
}


});