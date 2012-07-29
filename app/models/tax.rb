class Tax < ActiveRecord::Base
  attr_accessible :end_date, :percentage, :start_date
end
