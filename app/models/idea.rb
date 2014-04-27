class Idea < ActiveRecord::Base
  attr_accessible :text, :user, :phase, :accepted_at, :created_at

  belongs_to :phase
  belongs_to :user

  has_many :comments, as: :commentable
  has_many :taggings, :as => :taggable
  has_many :tags, :through => :taggings

  acts_as_voteable

end
