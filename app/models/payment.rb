class Payment < ActiveRecord::Base
  belongs_to :payment_type
  belongs_to :invoice
  attr_accessible :invoice_id, :payment_type_id, :amt
end
