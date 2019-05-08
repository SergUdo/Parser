class AddLatLonToMerchant < ActiveRecord::Migration[5.2]
  def change
    add_column :merchants, :latitude, :float
    add_column :merchants, :longitude, :float
  end
end
