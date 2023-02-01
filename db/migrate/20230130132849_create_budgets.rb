class CreateBudgets < ActiveRecord::Migration[7.0]
  def change
    create_table :budgets do |t|
      t.string :mode
      t.float :total
      t.float :price_km
      t.float :fixed_fee
      t.integer :deadline
      t.references :order, null: false, foreign_key: true
      t.references :vehicle, null: false, foreign_key: true

      t.timestamps
    end
  end
end
