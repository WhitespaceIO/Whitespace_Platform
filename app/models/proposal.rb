class Proposal < ActiveRecord::Base
  attr_accessible :text

  belongs_to :user

  make_voteable
  acts_as_commentable
end
