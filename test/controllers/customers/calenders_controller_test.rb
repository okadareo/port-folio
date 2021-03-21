require 'test_helper'

class Customers::CalendersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get customers_calenders_index_url
    assert_response :success
  end

end
