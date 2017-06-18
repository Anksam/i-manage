class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.integer :amount
      t.belongs_to :taskable, polymorphic: true
      t.timestamps
    end
    add_index :tasks, [:taskable_id, :taskable_type]
  end
end
