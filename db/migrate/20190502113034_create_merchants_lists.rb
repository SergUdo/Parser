class CreateMerchantsLists < ActiveRecord::Migration[5.2]
  def change
    create_table :merchants_lists do |t|

      t.timestamps
    end
  end
end
