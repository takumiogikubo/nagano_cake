class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|

      t.references :customer, null:false, foreign_key: true
      t.string :postal_code, null:false, defalt: ""
      t.string :address, null:false, defalt: ""
      t.string :name, null:false, defalt: ""
      t.integer :shipping_cost, null:false, defalt: ""
      t.integer :total_payment, null:false, defalt: ""
      t.integer :payment_method, null:false, defalt: ""
      t.integer :status, null:false, defalt: ""

      t.timestamps
    end
  end
end
