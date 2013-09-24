class Location < ActiveRecord::Base
  attr_accessible :city, :country, :latitude, :longitude, :name, :state

  belongs_to :project
end
