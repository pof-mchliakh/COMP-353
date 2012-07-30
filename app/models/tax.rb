class Tax < ActiveRecord::Base
  has_many :tax_types

  attr_accessible :end_date, :percentage, :start_date, :tax_type_id
  validates :percentage, :numericality => { :greater_than => 0, :less_than_or_equal_to => 100 }
end
