require 'test_helper'

class MerchantsListUploadTest < ActionDispatch::IntegrationTest

  test '' do
    u = User.create(email: "vasian2@example.com", password: "lkjlkjlk")
    sign_in u
    visit new_merchants_list_url
    count = MerchantsList.count
    file_input =  page.find("#merchants_list_list_file")
    file_input.attach_file 'test/fixtures/files/merchants_no.ods'
    click_on 'Ok'
    assert page.has_selector?('table')
    assert_equal MerchantsList.count, count + 1
  end
end
