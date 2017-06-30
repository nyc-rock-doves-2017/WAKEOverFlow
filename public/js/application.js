$(document).ready(function() {
  // upvote
  $( "[value='thumb_up']").click(function( event ) {
       event.preventDefault();
       var that = this;
       var parent_form_id = $(this).closest("form").attr('action').match(/\d+/)[0];
         $.ajax({
            url: "/questions/" + parent_form_id + "/vote/new" ,
            method: "POST",
            data: {"score": "1"}
         })
         .done(function( msg ) {
           $(that).css("color", "blue");
           $(that).parent().parent().find("[value='thumb_down']").css("color", "white");
           $(that).parent().parent().parent().parent().find("[name='score']").text(msg);

         })
         .fail(function(a,b,c) {
           alert( "error" + a + b + c);
         });
       });
          // down vote
       $( "[value='thumb_down']").click(function( event ) {
            event.preventDefault();
            var that = this;
            var parent_form_id = $(this).closest("form").attr('action').match(/\d+/)[0];
              $.ajax({
                 url: "/questions/" + parent_form_id + "/vote/new" ,
                 method: "POST",
                 data: {"score": "-1"}
              })
              .done(function( msg ) {
                $(that).css("color", "blue");
                $(that).parent().parent().find("[value='thumb_up']").css("color", "white");
                $(that).parent().parent().parent().parent().find("[name='score']").text(msg);
              })
              .fail(function(a,b,c) {
                alert( "error" + a + b + c);
              });
            });

});
