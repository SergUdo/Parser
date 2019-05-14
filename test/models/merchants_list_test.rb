require 'test_helper'

class MerchantsListTest < ActiveSupport::TestCase

  test 'file without header' do
    Merchant.delete_all
    m = MerchantsList.new(list_file: fixture_file_upload("files/merchants_no.ods"),
      kind_column: 1,
      owner_column: 2,
      name_column: 3,
      city_column: 5,
      address_column: 4
      )
    assert m.list_file.attached?
    m.parse!
    assert Merchant.count == 5
  end
end
