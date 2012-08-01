class Payment < ActiveRecord::Base
  belongs_to :payment_type
  attr_accessible :invoice_id, :payment_type_id
end
