class Project < ActiveRecord::Base
  attr_accessible :description, :name, :comments_attributes
  has_many :phases, dependent: :destroy

  validates :name, presence: true

  make_voteable
  acts_as_commentable
end
