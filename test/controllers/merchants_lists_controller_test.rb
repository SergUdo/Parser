require 'test_helper'

class MerchantsListsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    Merchant.create(name: "Магазин 24", address: "Шевченко 2")
    Merchant.create(name: "Магазин 25", address: "Шевченко 2")
    Merchant.create(name: "Магазин 26", address: "Шевченко 2")
    get merchants_lists_url
    assert_equal assigns(:merchants).size, 3
    assert_response :success
  end

  test "should get new" do
    get new_merchants_list_url
    assert_response :success
  end

  test "should get create" do
    post merchants_lists_url
    assert_response :redirect
  end

end
