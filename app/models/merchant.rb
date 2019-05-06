class Merchant < ApplicationRecord
  validates :address, presence: true
end
