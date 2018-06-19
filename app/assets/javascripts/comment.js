$(document).ready(function(){
  $(".comment-edit-#{comment.id}").click(function(){
        $(".comment-<%= comment.id %>").hide();
    });
});
