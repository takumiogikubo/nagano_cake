class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      
      t.references :customer, null:false, foreign_key: true
      t.string :name, null:false, defalt: ""
      t.string :postal_code, null:false, defalt: ""
      t.string :address, null:false, defalt: ""
      t.timestamps
    end
  end
end
