class AddDateAndDurationToIncomes < ActiveRecord::Migration
  def change
      add_column :incomes, :date, :date
      add_column :incomes, :duration, :float
  end
end
