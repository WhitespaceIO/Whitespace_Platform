class Resource < ActiveRecord::Base
  attr_accessible :name, :description, :type, :url, :user, :phases

  belongs_to :user

  has_many :taggings, :as => :taggable
  has_many :tags, :through => :taggings

  has_and_belongs_to_many :ideas

  acts_as_voteable

  validates_presence_of :name
  validates_presence_of :type
  validates_presence_of :url
  validates_presence_of :user

end