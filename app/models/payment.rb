class Payment < ActiveRecord::Base
  attr_accessible :invoice_id, :payment_type_id
end
