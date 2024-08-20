class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :postal_code,          null: false
      t.integer :area_id,             null: false
      t.string :city,                 null: false
      t.string :house_number,         null: false
      t.string :house_number,         null: false
      t.timestamps :building_name
      t.timestamps :phone_number      null: false
      t.references :order,            null: false, foreign_key: true
    end
  end
end
