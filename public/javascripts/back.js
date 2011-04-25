$(function(){
  setupCsrf();
  initHelpers();
  initSortables();
  initDelete();
});


/* Delete */
function initDelete(){
  $(".delete").click(function(e){
    e.preventDefault();
    var $this = $(this);
    $.post($this.attr("href"), {_method:"DELETE"}, function(data){
      $($this.attr("rel")).slideUp("slow");
    });
  });
}

/* Security */
function setupCsrf(){
  $(document).ajaxSend(function(e, xhr, options) {
    var token = $("meta[name='csrf-token']").attr("content");
    xhr.setRequestHeader("X-CSRF-Token", token);
  });
}

/* Sortable Lists */
function initSortables(){
  $(".sortable").sortable();
  
  $(".sortable").bind( "sortupdate", function(event, ui) {
    var items = new Array();
    var $this = $(this);
    var i = 0;
    $(".sortable li").each(function(){
      items[i] = $(this).attr("rel")
      i++;
    });
    $.post($this.attr("rel"), {item_ids: items});
  });
}

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
		time: 5000
	});
}