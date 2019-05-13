class AddFieldsToMerchantsList < ActiveRecord::Migration[5.2]
  
  def change
    add_column :merchants_lists, :name_column, :integer
    add_column :merchants_lists, :city_column, :integer
    add_column :merchants_lists, :kind_column, :integer
    add_column :merchants_lists, :owner_column, :integer
    add_column :merchants_lists, :address_column, :integer
  end
end
