class Tax < ActiveRecord::Base
  has_many :tax_types
  attr_accessible :end_date, :percentage, :start_date, :tax_type_id
end
