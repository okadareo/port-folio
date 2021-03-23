require 'test_helper'

class Admins::CalendarsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_calendars_index_url
    assert_response :success
  end

end
