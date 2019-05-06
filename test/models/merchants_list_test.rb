require 'test_helper'

class MerchantsListTest < ActiveSupport::TestCase

  test 'file without header' do
    Merchant.delete_all
    m = MerchantsList.new(list_file: fixture_file_upload("files/merchants_no.ods"))
    assert m.list_file.attached?
    m.parse!
    assert Merchant.count == 5
  end
end
