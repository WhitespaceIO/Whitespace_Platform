class Tag < ActiveRecord::Base
  attr_accessible :name

  has_many :taggings, :dependent => :destroy

  has_many :projects, :through => :taggings, :source => :taggable, :source_type => 'Project'
  has_many :phases, :through => :taggings, :source => :taggable, :source_type => 'Phase'
  has_many :ideas, :through => :taggings, :source => :taggable, :source_type => 'Idea'

end
