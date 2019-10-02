
$(function() {
  $('.item-main__photo__dot').mouseover(function(){
    var selectedSrc = $(this).attr('src').replace(/^(.+).item-main__photo__dot(\.gif|\.jpg|\.png+)$/, "$1"+"$2");
      $('img.item-main__photo__display').stop().fadeOut(70,
      function(){
        $('img.item-main__photo__display').attr('src', selectedSrc);
        $('img.item-main__photo__display').stop().fadeIn(380);
      }
    );
    $(this).css({
                  "border":"2px solid #0099e8",
                  "opacity":".8"
    });
  });
    $('.item-main__photo__dot').mouseout(function(){
    $(this).css({
                  "border":"",
                  "opacity":""
                
    });
  });
});

