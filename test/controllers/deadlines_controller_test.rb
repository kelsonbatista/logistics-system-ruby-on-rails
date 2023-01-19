require "test_helper"

class DeadlinesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get deadlines_index_url
    assert_response :success
  end
end
