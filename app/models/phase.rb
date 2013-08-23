class Phase < ActiveRecord::Base
  attr_accessible :description, :name, :ordinal, :started_at, :completed_at
  belongs_to :project
  has_many :proposals

  validates :name, presence: true

  acts_as_commentable
end
