require 'test_helper'

class MerchantsListsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    Merchant.create(name: "Магазин 24", address: "Шевченко 2")
    Merchant.create(name: "Магазин 25", address: "Шевченко 2")
    Merchant.create(name: "Магазин 26", address: "Шевченко 2")
    visit merchants_lists_url
    assert page.all(:css, 'tr').count == 3
  end

  test "redirect without user" do
    get new_merchants_list_url
    assert_response :redirect
  end

  test "get new with user" do
    u = User.create(email: "vasian@example.com", password: "lkjlkjlk")
    sign_in u 
    visit new_merchants_list_url
    assert page.has_content?("File")
  end

end
