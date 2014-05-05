class Idea < ActiveRecord::Base
  attr_accessible :text, :user, :phase, :accepted_at, :created_at, :resources

  belongs_to :phase
  belongs_to :user

  has_many :comments, as: :commentable
  has_many :taggings, :as => :taggable
  has_many :tags, :through => :taggings

  has_and_belongs_to_many :resources

  acts_as_voteable

  def accepted?
    self.accepted_at != nil
  end

end
