class Airport < ActiveRecord::Base

  geocoded_by :lnglat

  private
  def lnglat
    "#{self.longitude}, #{self.latitude}"
  end 
end
