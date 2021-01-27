require 'test_helper'

class Admin::MessagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_message = admin_messages(:one)
  end

  test "should get index" do
    get admin_messages_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_message_url
    assert_response :success
  end

  test "should create admin_message" do
    assert_difference('Admin::Message.count') do
      post admin_messages_url, params: { admin_message: {  } }
    end

    assert_redirected_to admin_message_url(Admin::Message.last)
  end

  test "should show admin_message" do
    get admin_message_url(@admin_message)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_message_url(@admin_message)
    assert_response :success
  end

  test "should update admin_message" do
    patch admin_message_url(@admin_message), params: { admin_message: {  } }
    assert_redirected_to admin_message_url(@admin_message)
  end

  test "should destroy admin_message" do
    assert_difference('Admin::Message.count', -1) do
      delete admin_message_url(@admin_message)
    end

    assert_redirected_to admin_messages_url
  end
end
