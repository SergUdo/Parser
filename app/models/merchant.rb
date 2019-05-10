class Merchant < ApplicationRecord
  validates :address, presence: true
  geocoded_by :full_address
  after_validation :geocode

  #scope :geocoded, -> { where('latitude IS NOT NULL AND longitude IS NOT NULL') }

  def full_address
    "#{city} #{address}" 
  end
end
