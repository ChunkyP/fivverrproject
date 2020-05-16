require "application_system_test_case"

class MessagesTest < ApplicationSystemTestCase
  setup do
    @message = messages(:one)
  end

  test "visiting the index" do
    visit messages_url
    assert_selector "h1", text: "Messages"
  end

  test "creating a Message" do
    visit messages_url
    click_on "New Message"

    fill_in "Avatar content type", with: @message.avatar_content_type
    fill_in "Avatar file name", with: @message.avatar_file_name
    fill_in "Avatar file size", with: @message.avatar_file_size
    fill_in "Avatar updated at", with: @message.avatar_updated_at
    fill_in "Body", with: @message.body
    fill_in "Channel", with: @message.channel_id
    fill_in "Message", with: @message.message
    fill_in "Msg type", with: @message.msg_type
    fill_in "Url", with: @message.url
    fill_in "User", with: @message.user_id
    click_on "Create Message"

    assert_text "Message was successfully created"
    click_on "Back"
  end

  test "updating a Message" do
    visit messages_url
    click_on "Edit", match: :first

    fill_in "Avatar content type", with: @message.avatar_content_type
    fill_in "Avatar file name", with: @message.avatar_file_name
    fill_in "Avatar file size", with: @message.avatar_file_size
    fill_in "Avatar updated at", with: @message.avatar_updated_at
    fill_in "Body", with: @message.body
    fill_in "Channel", with: @message.channel_id
    fill_in "Message", with: @message.message
    fill_in "Msg type", with: @message.msg_type
    fill_in "Url", with: @message.url
    fill_in "User", with: @message.user_id
    click_on "Update Message"

    assert_text "Message was successfully updated"
    click_on "Back"
  end

  test "destroying a Message" do
    visit messages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Message was successfully destroyed"
  end
end
