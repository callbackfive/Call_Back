require "application_system_test_case"

class Admin::GivebacksTest < ApplicationSystemTestCase
  setup do
    @admin_giveback = admin_givebacks(:one)
  end

  test "visiting the index" do
    visit admin_givebacks_url
    assert_selector "h1", text: "Admin/Givebacks"
  end

  test "creating a Giveback" do
    visit admin_givebacks_url
    click_on "New Admin/Giveback"

    click_on "Create Giveback"

    assert_text "Giveback was successfully created"
    click_on "Back"
  end

  test "updating a Giveback" do
    visit admin_givebacks_url
    click_on "Edit", match: :first

    click_on "Update Giveback"

    assert_text "Giveback was successfully updated"
    click_on "Back"
  end

  test "destroying a Giveback" do
    visit admin_givebacks_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Giveback was successfully destroyed"
  end
end
