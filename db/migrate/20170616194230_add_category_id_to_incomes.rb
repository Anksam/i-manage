class AddCategoryIdToIncomes < ActiveRecord::Migration[5.0]
  def change
    add_column :incomes, :category_id, :integer
  end
end
