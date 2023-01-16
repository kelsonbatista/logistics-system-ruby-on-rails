require "test_helper"

class ModesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get modes_index_url
    assert_response :success
  end
end
