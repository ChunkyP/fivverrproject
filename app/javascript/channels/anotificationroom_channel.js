import consumer from "./consumer"

consumer.subscriptions.create("AnotificationroomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    debugger
    var current_user_id = $("#nav-user").val();
    var sender_id = $(data.message).last().val();
    if(current_user_id != sender_id) {
      $(".navbar-nav").find(".badge").removeClass('hidden');
      $('audio')[1].click();
      $('audio')[1].play();
    }
  }
});
