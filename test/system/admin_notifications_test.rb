require "application_system_test_case"

class AdminNotificationsTest < ApplicationSystemTestCase
  setup do
    @admin_notification = admin_notifications(:one)
  end

  test "visiting the index" do
    visit admin_notifications_url
    assert_selector "h1", text: "Admin Notifications"
  end

  test "creating a Admin notification" do
    visit admin_notifications_url
    click_on "New Admin Notification"

    fill_in "Body", with: @admin_notification.body
    click_on "Create Admin notification"

    assert_text "Admin notification was successfully created"
    click_on "Back"
  end

  test "updating a Admin notification" do
    visit admin_notifications_url
    click_on "Edit", match: :first

    fill_in "Body", with: @admin_notification.body
    click_on "Update Admin notification"

    assert_text "Admin notification was successfully updated"
    click_on "Back"
  end

  test "destroying a Admin notification" do
    visit admin_notifications_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Admin notification was successfully destroyed"
  end
end
