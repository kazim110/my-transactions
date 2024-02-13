class CreateJoinTableCategoriesPurchases < ActiveRecord::Migration[7.1]
  def change
    create_join_table :categories, :purchases do |t|
      t.index :category_id
      t.index :purchase_id
    end
  end
end
