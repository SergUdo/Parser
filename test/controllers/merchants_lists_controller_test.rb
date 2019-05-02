require 'test_helper'

class MerchantsListsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    Merchant.create(name: "Магазин 24")
    Merchant.create(name: "Магазин 25")
    Merchant.create(name: "Магазин 26")
    get merchants_lists_index_url
    assert_equal assigns(:merchants).size, 3 
    assert_response :success
  end

  test "should get new" do
    get merchants_lists_new_url
    assert_response :success
  end

  test "should get create" do
    get merchants_lists_create_url
    assert_response :success
  end

end
