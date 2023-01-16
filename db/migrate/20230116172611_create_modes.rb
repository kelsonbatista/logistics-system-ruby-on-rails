class CreateModes < ActiveRecord::Migration[7.0]
  def change
    create_table :modes do |t|
      t.string :name
      t.integer :min_distance
      t.integer :max_distance
      t.integer :min_weight
      t.integer :max_weight
      t.integer :fixed_fee
      t.boolean :active, default: 1

      t.timestamps
    end
  end
end
