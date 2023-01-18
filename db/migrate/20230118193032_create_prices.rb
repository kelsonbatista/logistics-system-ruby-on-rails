class CreatePrices < ActiveRecord::Migration[7.0]
  def change
    create_table :prices do |t|
      t.integer :min_weight
      t.integer :max_weight
      t.float :price_per_km
      t.references :mode, null: false, foreign_key: true

      t.timestamps
    end
  end
end
