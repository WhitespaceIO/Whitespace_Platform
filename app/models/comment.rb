class Comment < ActiveRecord::Base
  attr_accessible :text, :user

  belongs_to :user
  belongs_to :commentable, :polymorphic => true

  default_scope :order => 'created_at ASC'

  validates_length_of :text, :minimum => 2
  validates_presence_of :user
  validates_presence_of :commentable

end
