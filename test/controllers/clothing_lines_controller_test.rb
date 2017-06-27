require 'test_helper'

class ClothingLinesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get clothing_lines_show_url
    assert_response :success
  end

end
