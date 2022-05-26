class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|

      t.references :genre, null:false, foreign_key: true
      t.string :name, null:false, default: ""
      t.text :introduction, null:false, default: ""
      t.integer :price, null:false, default: ""
      t.boolean :is_active, null:false, default:false

      t.timestamps
    end
  end
end
