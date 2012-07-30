class MissionSheet < ActiveRecord::Base
  attr_accessible :actual_end_time, :actual_start_time, :end_odometer, :mission_id, :start_odometer
end
