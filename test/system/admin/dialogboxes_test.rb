require "application_system_test_case"

class Admin::DialogboxesTest < ApplicationSystemTestCase
  setup do
    @admin_dialogbox = admin_dialogboxes(:one)
  end

  test "visiting the index" do
    visit admin_dialogboxes_url
    assert_selector "h1", text: "Admin/Dialogboxes"
  end

  test "creating a Dialogbox" do
    visit admin_dialogboxes_url
    click_on "New Admin/Dialogbox"

    click_on "Create Dialogbox"

    assert_text "Dialogbox was successfully created"
    click_on "Back"
  end

  test "updating a Dialogbox" do
    visit admin_dialogboxes_url
    click_on "Edit", match: :first

    click_on "Update Dialogbox"

    assert_text "Dialogbox was successfully updated"
    click_on "Back"
  end

  test "destroying a Dialogbox" do
    visit admin_dialogboxes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Dialogbox was successfully destroyed"
  end
end
