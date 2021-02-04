require 'test_helper'

class Customers::CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get customers_customers_show_url
    assert_response :success
  end

end
