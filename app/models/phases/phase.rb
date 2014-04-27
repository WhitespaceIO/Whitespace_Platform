class Phase < ActiveRecord::Base
  attr_accessible :type, :started_at, :completed_at, :created_at, :updated_at

  belongs_to :project

  has_many :ideas
  has_many :comments, as: :commentable
  has_many :taggings, :as => :taggable
  has_many :tags, :through => :taggings

  def name
    self.type.capitalize
  end

  def slug
    self.type.downcase
  end

  def started?
    self.started_at != nil
  end

  def completed?
    self.completed_at != nil
  end

  def pending?
    self.completed_at == nil
  end

  def last_idea
    self.ideas.sort_by {|i| i.created_at}.last unless self.ideas.empty?
  end

  def accepted_idea
    self.ideas.where(:accepted_at != nil) unless self.ideas.empty?
  end

  def to_param
    type.downcase
  end

  def resources
    _resources = []
    self.ideas.each do |idea|
      if idea.accepted?
        idea.resources.each do |resource|
          _resources << resource
        end
      end
    end
    _resources.flatten
  end

end
