require 'test_helper'

class AdminNotificationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_notification = admin_notifications(:one)
  end

  test "should get index" do
    get admin_notifications_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_notification_url
    assert_response :success
  end

  test "should create admin_notification" do
    assert_difference('AdminNotification.count') do
      post admin_notifications_url, params: { admin_notification: { body: @admin_notification.body } }
    end

    assert_redirected_to admin_notification_url(AdminNotification.last)
  end

  test "should show admin_notification" do
    get admin_notification_url(@admin_notification)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_notification_url(@admin_notification)
    assert_response :success
  end

  test "should update admin_notification" do
    patch admin_notification_url(@admin_notification), params: { admin_notification: { body: @admin_notification.body } }
    assert_redirected_to admin_notification_url(@admin_notification)
  end

  test "should destroy admin_notification" do
    assert_difference('AdminNotification.count', -1) do
      delete admin_notification_url(@admin_notification)
    end

    assert_redirected_to admin_notifications_url
  end
end
