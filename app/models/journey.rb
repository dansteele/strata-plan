class Journey < ActiveRecord::Base

  belongs_to :traveller 
  has_many :waypoints, -> { order("position ASC") }

end
