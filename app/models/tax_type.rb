class TaxType < ActiveRecord::Base
  has_many :taxes
  attr_accessible :name
end
