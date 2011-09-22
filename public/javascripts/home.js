$(function(){
  $("#new_future_user").submit(function(e){
    e.preventDefault();
    var val = $("#email-input").val();
    if(val != ""){
      $.post(this.action, {email: val}, function(data){
        $("#request-data .first-step").slideUp("slow");
        $("#request-data .second-step").slideDown("slow");
      });
    }
  });

  $(".request-link").click(function(e){
    e.preventDefault();
    $.scrollTo("#request-data", "slow");
    $("#email-input").focus();
  });
})

