require 'test_helper'

class TeamMembersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get team_members_show_url
    assert_response :success
  end

end
