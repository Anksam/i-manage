class CreateExpenseCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :expense_categories do |t|
      t.string :category_name
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
