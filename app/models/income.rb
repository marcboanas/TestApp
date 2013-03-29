
class Income < ActiveRecord::Base
    attr_accessible :amount, :client_id, :date, :duration
    belongs_to :client
    
    validates :client_id, presence: true
    validates :amount, presence: true

    default_scope order: 'incomes.date ASC'
end
