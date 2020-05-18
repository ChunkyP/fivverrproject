import consumer from "./consumer"

function scroll_bottom() {
  if($(".chat_messages").length > 0 ){
    $(".chat_messages").scrollTop($(".chat_messages")[0].scrollHeight)
  }
}

consumer.subscriptions.create("ChatroomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    var user_id = $("#user_idd").val();
    var channel_id = $("#c_channel_id").val();
    var channel_item = $(".channel-"+$(data.message).last().val());
    if(!channel_item.hasClass('active')){
      $.ajax({
        method: 'POSt',
        url: '/make-notification',
        data: {channel_id: $(data.message).last().val(), user_id: user_id},
        success: function(){
          var badge = $(channel_item).find('.my-badge');
          $(badge).css('display','block');
          var muted = $("#muted").val();
          var muted_channel_ids = muted.split(",");
          if(muted.indexOf($(data.message).last().val()) == "-1" && $(data.message).last().val() != channel_id){
            $('audio')[0].click();  
            $('audio')[0].play();
          }
        },
        error: function(){

        }
      })
    };
    if (channel_id == $(data.message).last().val()){
      if(user_id == $(data.message).first().val()){
        $(".chat_messages").append($(data.message)[2]);
      }else{
        $(".chat_messages").append($(data.message)[4]);
      }
      scroll_bottom();
    }
    // Called when there's incoming data on the websocket for this channel
  }
});
