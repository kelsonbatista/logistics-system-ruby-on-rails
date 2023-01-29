class CreateVehicles < ActiveRecord::Migration[7.0]
  def change
    create_table :vehicles do |t|
      t.string :plate
      t.string :brand
      t.string :model
      t.string :category
      t.integer :year
      t.integer :capacity
      t.integer :status, default: 0
      t.references :mode, null: false, foreign_key: true

      t.timestamps
    end
  end
end
