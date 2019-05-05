require 'test_helper'

class MerchantTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test 'model creating successfully' do
    m = Merchant.create(
      origin_id:1, 
      kind:"м",
      owner:"ООО Альбатрос",
      name:"Магазин №24",
      city:"Константиновка",
      address:"ул.Нахимова")
    assert m.persisted?
    mm = m.dup
    assert_raises ActiveRecord::RecordNotUnique do
      mm.save 
    end
  end

end
