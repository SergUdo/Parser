class RemoveOriginIdFromMerchantsList < ActiveRecord::Migration[5.2]
  def change
    remove_column :merchants, :origin_id
  end
end
