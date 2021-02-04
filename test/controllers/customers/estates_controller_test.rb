require 'test_helper'

class Customers::EstatesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customers_estates_index_url
    assert_response :success
  end

  test "should get show" do
    get customers_estates_show_url
    assert_response :success
  end

  test "should get finish" do
    get customers_estates_finish_url
    assert_response :success
  end

end
