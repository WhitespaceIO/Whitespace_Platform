class Proposal < ActiveRecord::Base
  attr_accessible :text

  make_voteable
  acts_as_commentable
end
