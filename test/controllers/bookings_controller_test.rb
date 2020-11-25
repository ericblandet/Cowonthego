require 'test_helper'

class BookingsControllerTest < ActionDispatch::IntegrationTest
  test "should get start_date:date" do
    get bookings_start_date:date_url
    assert_response :success
  end

  test "should get end_date:date" do
    get bookings_end_date:date_url
    assert_response :success
  end

  test "should get price:integer" do
    get bookings_price:integer_url
    assert_response :success
  end

end
