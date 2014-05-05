class Resource < ActiveRecord::Base
  attr_accessible :name, :description, :type, :url, :user, :favicon, :ideas, :tags

  belongs_to :user

  has_many :taggings, :as => :taggable
  has_many :tags, :through => :taggings

  has_and_belongs_to_many :ideas

  acts_as_voteable

  validates_presence_of :name
  validates_presence_of :url

  def tag_list
    tags.select(:name).map(&:name)
  end

  def tag_count
    tags.length
  end

end