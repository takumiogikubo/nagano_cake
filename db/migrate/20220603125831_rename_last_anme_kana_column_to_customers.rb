class RenameLastAnmeKanaColumnToCustomers < ActiveRecord::Migration[6.1]
  def change
    rename_column :customers, :last_anme_kana, :last_name_kana
  end
end
