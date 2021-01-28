require "application_system_test_case"

class Admin::MessagesTest < ApplicationSystemTestCase
  setup do
    @admin_message = admin_messages(:one)
  end

  test "visiting the index" do
    visit admin_messages_url
    assert_selector "h1", text: "Admin/Messages"
  end

  test "creating a Message" do
    visit admin_messages_url
    click_on "New Admin/Message"

    click_on "Create Message"

    assert_text "Message was successfully created"
    click_on "Back"
  end

  test "updating a Message" do
    visit admin_messages_url
    click_on "Edit", match: :first

    click_on "Update Message"

    assert_text "Message was successfully updated"
    click_on "Back"
  end

  test "destroying a Message" do
    visit admin_messages_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Message was successfully destroyed"
  end
end
