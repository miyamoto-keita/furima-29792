class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|

      t.timestamps
      t.string :name,                     null: false
      t.references :user,                 null: false,foreign_key: true 
      t.integer :price,                   null: false
      t.text :description,                null: false
      t.integer :category_id,             null: false
      t.integer :status_id,               null: false
      t.integer :delivery_charge_id,      null: false
      t.integer :area_id,                 null: false
      t.integer :delivery_date_id,        null: false
    end
  end
end
