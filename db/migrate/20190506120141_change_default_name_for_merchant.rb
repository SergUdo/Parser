class ChangeDefaultNameForMerchant < ActiveRecord::Migration[5.2]
  def change
    change_column_default :merchants, :name, "Магазин"
  end
end
