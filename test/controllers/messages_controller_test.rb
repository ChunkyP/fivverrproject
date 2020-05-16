require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @message = messages(:one)
  end

  test "should get index" do
    get messages_url
    assert_response :success
  end

  test "should get new" do
    get new_message_url
    assert_response :success
  end

  test "should create message" do
    assert_difference('Message.count') do
      post messages_url, params: { message: { avatar_content_type: @message.avatar_content_type, avatar_file_name: @message.avatar_file_name, avatar_file_size: @message.avatar_file_size, avatar_updated_at: @message.avatar_updated_at, body: @message.body, channel_id: @message.channel_id, message: @message.message, msg_type: @message.msg_type, url: @message.url, user_id: @message.user_id } }
    end

    assert_redirected_to message_url(Message.last)
  end

  test "should show message" do
    get message_url(@message)
    assert_response :success
  end

  test "should get edit" do
    get edit_message_url(@message)
    assert_response :success
  end

  test "should update message" do
    patch message_url(@message), params: { message: { avatar_content_type: @message.avatar_content_type, avatar_file_name: @message.avatar_file_name, avatar_file_size: @message.avatar_file_size, avatar_updated_at: @message.avatar_updated_at, body: @message.body, channel_id: @message.channel_id, message: @message.message, msg_type: @message.msg_type, url: @message.url, user_id: @message.user_id } }
    assert_redirected_to message_url(@message)
  end

  test "should destroy message" do
    assert_difference('Message.count', -1) do
      delete message_url(@message)
    end

    assert_redirected_to messages_url
  end
end
