class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.string :code, limit: 15
      t.integer :recipient
      t.integer :sender
      t.integer :product
      t.integer :distance
      t.integer :status

      t.timestamps
    end
  end
end
