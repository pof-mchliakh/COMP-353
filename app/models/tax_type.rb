class TaxType < ActiveRecord::Base
  belongs_to :tax
  attr_accessible :name
end
