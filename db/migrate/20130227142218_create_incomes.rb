class CreateIncomes < ActiveRecord::Migration
  def change
    create_table :incomes do |t|
      t.float :amount
      t.integer :client_id

      t.timestamps
    end
  end
end
