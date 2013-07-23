class Phase < ActiveRecord::Base
  attr_accessible :description, :name, :ordinal
  belongs_to :project

  validates :name, presence: true
end
