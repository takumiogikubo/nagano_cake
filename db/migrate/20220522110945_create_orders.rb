class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.references :customer, null:false, foreign_key: true
      t.string :postal_code, null:false, default: ""
      t.string :address, null:false, default: ""
      t.string :name, null:false, default: ""
      t.integer :shipping_cost, null:false, default: ""
      t.integer :total_payment, null:false, default: ""
      t.integer :payment_method, null:false, default: 0
      t.integer :status, null:false, default: 0

      t.timestamps
    end
  end
end
