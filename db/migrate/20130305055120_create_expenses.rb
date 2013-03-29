class CreateExpenses < ActiveRecord::Migration
  def change
    create_table :expenses do |t|
      t.date :date
      t.float :amount
      t.string :expense_type
      t.text :description
      t.integer :user_id

      t.timestamps
    end
      add_index :expenses, [:user_id, :created_at]
  end
end
