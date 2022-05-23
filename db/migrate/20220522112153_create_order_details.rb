class CreateOrderDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :order_details do |t|

      t.references :order, null:false, foreign_key: true
      t.references :item, null:false, foreign_key: true
      t.integer :price, null:false, defalt: ""
      t.integer :amount, null:false, defalt: ""
      t.integer :makig_status, null:false, defalt: ""

      t.timestamps
    end
  end
end
