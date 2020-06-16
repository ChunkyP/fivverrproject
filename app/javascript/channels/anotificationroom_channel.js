import consumer from "./consumer"

consumer.subscriptions.create("AnotificationroomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    $(".navbar-nav").find(".badge").removeClass('hidden');
  }
});
