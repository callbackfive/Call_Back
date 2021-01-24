require "application_system_test_case"

class Admin::NotificationsTest < ApplicationSystemTestCase
  setup do
    @admin_notification = admin_notifications(:one)
  end

  test "visiting the index" do
    visit admin_notifications_url
    assert_selector "h1", text: "Admin/Notifications"
  end

  test "creating a Notification" do
    visit admin_notifications_url
    click_on "New Admin/Notification"

    click_on "Create Notification"

    assert_text "Notification was successfully created"
    click_on "Back"
  end

  test "updating a Notification" do
    visit admin_notifications_url
    click_on "Edit", match: :first

    click_on "Update Notification"

    assert_text "Notification was successfully updated"
    click_on "Back"
  end

  test "destroying a Notification" do
    visit admin_notifications_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Notification was successfully destroyed"
  end
end
