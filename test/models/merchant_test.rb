require 'test_helper'

class MerchantTest < ActiveSupport::TestCase

  test 'model creating successfully' do
    m = Merchant.create(
      kind:"м",
      owner:"ООО Альбатрос",
      name:"Магазин №24",
      city:"Константиновка",
      address:"ул.Нахимова")
    assert m.persisted?
    mm = m.dup
    assert mm.invalid?
  end

end
