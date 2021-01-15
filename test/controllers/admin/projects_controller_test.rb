require 'test_helper'

class Admin::ProjectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_project = admin_projects(:one)
  end

  test "should get index" do
    get admin_projects_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_project_url
    assert_response :success
  end

  test "should create admin_project" do
    assert_difference('Admin::Project.count') do
      post admin_projects_url, params: { admin_project: {  } }
    end

    assert_redirected_to admin_project_url(Admin::Project.last)
  end

  test "should show admin_project" do
    get admin_project_url(@admin_project)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_project_url(@admin_project)
    assert_response :success
  end

  test "should update admin_project" do
    patch admin_project_url(@admin_project), params: { admin_project: {  } }
    assert_redirected_to admin_project_url(@admin_project)
  end

  test "should destroy admin_project" do
    assert_difference('Admin::Project.count', -1) do
      delete admin_project_url(@admin_project)
    end

    assert_redirected_to admin_projects_url
  end
end
