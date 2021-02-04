require 'test_helper'

class Admins::EstatesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get admins_estates_new_url
    assert_response :success
  end

  test "should get index" do
    get admins_estates_index_url
    assert_response :success
  end

end
