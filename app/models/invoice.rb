class Invoice < ActiveRecord::Base  
  has_many :payments
  attr_accessible :date, :reservation_id
end
