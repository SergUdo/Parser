class MerchantsList < ApplicationRecord
  def self.parse(list_file = nil)
    return unless list_file
    list = Roo::OpenOffice.new list_file.path, extension: :xls
    list.sheet(0).parse.each do |row|
      create_merchant(*row.first(6))
    end
  end

  def self.create_merchant(oid, k, o, n, c, a)
    Merchant.create(
      origin_id: oid, 
      kind: k,
      owner: o,
      name: n,
      city: c,
      address: a)
  end
end
