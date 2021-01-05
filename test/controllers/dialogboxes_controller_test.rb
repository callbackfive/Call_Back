require 'test_helper'

class DialogboxesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get dialogboxes_index_url
    assert_response :success
  end

end
