class CreateAddresses < ActiveRecord::Migration[7.0]
  def change
    create_table :addresses do |t|
      t.string :person
      t.string :address_one
      t.string :address_two
      t.string :city
      t.string :state, limit: 2
      t.string :zip, limit: 9

      t.timestamps
    end
  end
end
