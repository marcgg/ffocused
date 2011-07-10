$(function(){
  setupCsrf();
  initHelpers();
  initSortables();
  initDelete();
  initCategoryForm();
  initTheme();
  initRemoteAccounts();
});

/* Remote Accounts*/
function initRemoteAccounts(){
  $("#choose-account a").click(function(e){
    e.preventDefault();
    var $this = $(this);
    $(".account").hide();
    $("#choose-account .selected").removeClass("selected");
    $($this.attr("rel")).show();
    $this.addClass("selected");
  });
  
  $(".delete-remote-account").click(function(e){
    e.preventDefault();
    var $this = $(this);
    $.post($this.attr("href"), {_method: "DELETE"}, function(){
      $($this.attr("rel")).slideUp("fast");
    });
  });
}

/* Themes */
function initTheme(){
  $("#use-css-editor").click(function(e){
    $("#theme-type-picker .selected").removeClass("selected");
    $("#css-editor").show();
    $("#portfolio_theme_id").val("");
    $(this).addClass("selected");
    $("#all-themes").hide();
  });

  $("#use-theme").click(function(e){
    $("#css-editor").hide();
    $("#all-themes").show();
    $("#theme-type-picker .selected").removeClass("selected");
    $(this).addClass("selected");
  });

  $("#all-themes .theme .image").click(function(e){
    var $this = $(this);
    $("#all-themes .selected").removeClass("selected");
    $("#portfolio_theme_id").val($this.parent().attr("rel"));
    $this.parent().addClass("selected");
  });
}

/* Category */
function initCategoryForm(){
  $("#flickr-category-select #type").live("change", function(e){
    var $this = $(this);
    if($this.val() == "Category::Flickr::FromTag"){
      $("#group-flickr-set").hide();
      $("#group-flickr-tags").show();
    }else if($this.val() == "Category::Flickr::FromSet"){
      $("#group-flickr-set").show();
      $("#group-flickr-tags").hide();
    }
  });
  
  $(".get-new-category-form").click(function(e){
    e.preventDefault();
    var $this = $(this);
    $.get($this.attr("href"), function(data){
      $("#new-category-form").html(data);
      $("#all-get-category-form").hide();
      $("#flickr-category-select #type").val("Category::FromSet");
    });
  });
}
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
  
  $(".hide-self").click(function(e){
    e.preventDefault();
    $(this).parent().hide();
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
