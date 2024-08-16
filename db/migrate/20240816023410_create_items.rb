class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string   :title,              null: false
      t.text     :text,               null: false
      t.integer  :category_id,        null: false
      t.integer  :condition_id,       null: false
      t.integer  :delivery_charge_id, null: false
      t.integer  :area_id,            null: false
      t.integer  :days_to_ship_id,    null: false
      t.timestamps
    end
  end
end
