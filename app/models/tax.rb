class Tax < ActiveRecord::Base
  belongs_to :tax_type

  attr_accessible :end_date, :percentage, :start_date, :tax_type_id
  validates :percentage, :numericality => { :greater_than => 0, :less_than_or_equal_to => 100 }
end
