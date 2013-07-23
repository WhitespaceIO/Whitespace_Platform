class Phase < ActiveRecord::Base
  attr_accessible :description, :name, :ordinal, :comments_attributes
  belongs_to :project
  has_many :proposals

  validates :name, presence: true

  acts_as_commentable
end
