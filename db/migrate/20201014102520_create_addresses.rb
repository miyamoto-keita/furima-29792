class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postcode
      t.integer    :area_id
      t.string     :city
      t.string     :block
      t.string     :building_name
      t.string     :phone_number
      t.references :purchase,          null: false,  foreign_key: true
      t.timestamps
    end
  end
end
