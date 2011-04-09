$(function(){
  initHelpers();
});

/* Simple snippets */
function initHelpers(){
  $(".show-rel").click(function(e){
    e.preventDefault();
    $($(this).attr("rel")).show();
  });
}

/* Growl-like notifications*/
function startGritter(my_title, my_text){
  $.gritter.add({
		title: my_title,
		text: my_text,
		sticky: false,
		time: 3000
	});
}