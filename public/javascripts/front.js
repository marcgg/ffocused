function showImage( element ){
  element.parents('.image-wrapper').css({
    'background-image':'none',
    'height':element.height()
  });
  element.fadeIn(500, 'linear');
}

$(window).load(function(){
  showImage($('#content div.photo img').not(':visible'));
});

function showPhotos(){
  $('#content div.photo img').load(function(){
    showImage($(this));
  });
}

showPhotos();
