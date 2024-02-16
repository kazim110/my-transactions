class CreateCategoriesPurchasesJoinTable < ActiveRecord::Migration[7.1]
  def change
    create_table :categories_purchases, id: false do |t|
      t.references :category, foreign_key: true
      t.references :purchase, foreign_key: true
    end
    add_index :categories_purchases, [:category_id, :purchase_id], unique: true
  end
end
