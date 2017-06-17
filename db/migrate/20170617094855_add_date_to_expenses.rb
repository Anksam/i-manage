class AddDateToExpenses < ActiveRecord::Migration[5.0]
  def change
    add_column :expenses, :date, :date
  end
end
