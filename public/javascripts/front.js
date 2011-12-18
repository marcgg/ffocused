function showImage( elements ){
  for(var i=0; i< elements.length; i++){
    element = elements.eq(i);
    element.parents('.image-wrapper').css({
      'background-image':'none',
      'height':element.innerHeight()
    });
    element.fadeIn(500, 'linear');
  }
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
