class AddHeaderIndicatorToMerchantsList < ActiveRecord::Migration[5.2]
  def change
    add_column :merchants_lists, :ignore_header, :boolean
  end
end
