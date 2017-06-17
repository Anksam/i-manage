class AddDateToIncomes < ActiveRecord::Migration[5.0]
  def change
    add_column :incomes, :date, :date
  end
end
