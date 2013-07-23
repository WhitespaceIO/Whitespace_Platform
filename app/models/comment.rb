class Comment < ActiveRecord::Base
  attr_accessible :text

  validates :text, presence: true

  make_voteable
end
