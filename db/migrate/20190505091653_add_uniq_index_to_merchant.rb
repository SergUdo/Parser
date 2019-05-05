class AddUniqIndexToMerchant < ActiveRecord::Migration[5.2]
  def change
    add_index :merchants, [:address, :name], unique: true
  end
end
