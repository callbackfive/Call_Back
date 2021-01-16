require 'test_helper'

class Admin::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_comment = admin_comments(:one)
  end

  test "should get index" do
    get admin_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_comment_url
    assert_response :success
  end

  test "should create admin_comment" do
    assert_difference('Admin::Comment.count') do
      post admin_comments_url, params: { admin_comment: {  } }
    end

    assert_redirected_to admin_comment_url(Admin::Comment.last)
  end

  test "should show admin_comment" do
    get admin_comment_url(@admin_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_comment_url(@admin_comment)
    assert_response :success
  end

  test "should update admin_comment" do
    patch admin_comment_url(@admin_comment), params: { admin_comment: {  } }
    assert_redirected_to admin_comment_url(@admin_comment)
  end

  test "should destroy admin_comment" do
    assert_difference('Admin::Comment.count', -1) do
      delete admin_comment_url(@admin_comment)
    end

    assert_redirected_to admin_comments_url
  end
end
