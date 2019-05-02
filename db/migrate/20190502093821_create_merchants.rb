class CreateMerchants < ActiveRecord::Migration[5.2]
  def change
    create_table :merchants do |t|
      t.integer :origin_id
      t.string :kind
      t.string :owner
      t.string :name
      t.string :address
      t.string :city

      t.timestamps
    end
  end
end
