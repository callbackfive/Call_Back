require 'test_helper'

class Admin::GivebacksControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_giveback = admin_givebacks(:one)
  end

  test "should get index" do
    get admin_givebacks_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_giveback_url
    assert_response :success
  end

  test "should create admin_giveback" do
    assert_difference('Admin::Giveback.count') do
      post admin_givebacks_url, params: { admin_giveback: {  } }
    end

    assert_redirected_to admin_giveback_url(Admin::Giveback.last)
  end

  test "should show admin_giveback" do
    get admin_giveback_url(@admin_giveback)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_giveback_url(@admin_giveback)
    assert_response :success
  end

  test "should update admin_giveback" do
    patch admin_giveback_url(@admin_giveback), params: { admin_giveback: {  } }
    assert_redirected_to admin_giveback_url(@admin_giveback)
  end

  test "should destroy admin_giveback" do
    assert_difference('Admin::Giveback.count', -1) do
      delete admin_giveback_url(@admin_giveback)
    end

    assert_redirected_to admin_givebacks_url
  end
end
