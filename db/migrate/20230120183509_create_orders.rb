class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :code, limit: 15
      t.integer :distance
      t.integer :mode
      t.integer :price
      t.integer :deadline
      t.integer :status, default: 0

      t.timestamps
    end
  end
end
