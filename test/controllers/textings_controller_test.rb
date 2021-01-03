require 'test_helper'

class TextingsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get textings_index_url
    assert_response :success
  end

end
