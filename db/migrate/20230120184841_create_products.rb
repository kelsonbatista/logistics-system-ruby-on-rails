class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :code
      t.integer :width
      t.integer :height
      t.integer :depth
      t.integer :weight
      t.references :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
