class AddDateToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :date, :date
  end
end
