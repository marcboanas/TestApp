class Client < ActiveRecord::Base
  attr_accessible :name, :status
  belongs_to :user
    has_many :incomes, dependent: :destroy
    
  validates :user_id, presence: true
  validates :name, presence: true
    
  default_scope order: 'clients.created_at DESC'
    
    def self.list_user_clients
    
    Client.where("user_id = ?", "102").select("id, name").map {|x| [x.id, x.name] }
    
    end
end
