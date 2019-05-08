class Merchant < ApplicationRecord
  validates :address, presence: true
  geocoded_by :full_address
  after_validation :geocode

  def full_address
    "#{city} #{address}" 
  end
end
