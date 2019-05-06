require 'test_helper'

class MerchantsListUploadTest < ActionDispatch::IntegrationTest

  test '' do
    u = User.create(email: "vasian2@example.com", password: "lkjlkjlk")
    sign_in u
    visit new_merchants_list_url
    count = MerchantsList.count
    attach_file 'File', 'test/fixtures/files/merchants_no.ods'
    click_on 'ok'
    assert page.has_selector?('table')
    assert_equal MerchantsList.count, count + 1
  end
end
