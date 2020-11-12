require 'test_helper'

class BaseballsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get baseballs_index_url
    assert_response :success
  end

end
