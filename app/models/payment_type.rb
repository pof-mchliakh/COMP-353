class PaymentType < ActiveRecord::Base
  has_many :payments
  attr_accessible :name
end
