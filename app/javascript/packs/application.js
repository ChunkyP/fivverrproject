// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("@rails/activestorage").start()
require("channels")

// Include main stylesheet
require("../source/main.scss")

// Include main file
require("../source/main")

function submit_message() {
    $("#message_message").on('keydown', function(e) {
        if(e.keyCode == 13){
            $("#message_form").submit();
            $("#message_message").val("");
        }
    })
}
// $("#message_form").submit();
//       $("#message_message").val("");
function scroll_bottom() {
    if($(".chat_messages_parent").length > 0 ){
        $(".chat_messages_parent").animate({ scrollTop: $('.chat_messages_parent').prop("scrollHeight") }, 1000)
    }
}
/*$(function () {
    scroll_bottom();
     submit_message();
     $("#message_form").bind("ajax:complete", function(event,xhr,status){
       debugger
       $('#message_message').val('');
     });
})*/
// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


