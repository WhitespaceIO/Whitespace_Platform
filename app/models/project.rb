class Project < ActiveRecord::Base
  attr_accessible :description, :name
  has_many :phases, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :name, presence: true

  make_voteable
end
