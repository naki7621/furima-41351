class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.string   :title,        null: false
      t.text     :text,         null: false
      
      t.timestamps
    end
  end
end
