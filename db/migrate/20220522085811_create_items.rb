class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.references :genre, null:t.false, foreign_key: true
      t.string :name, null:false, defalt: ""
      t.text :introduction, null:false, defalt: ""
      t.integer :price, null:false, defalt: ""
      t.boolean :is_active, null:false, defalt:false

      t.timestamps
    end
  end
end
