class Expense < ActiveRecord::Base
  attr_accessible :amount, :date, :description, :expense_type
    belongs_to :user
    
  default_scope order: 'expenses.date ASC'
end
