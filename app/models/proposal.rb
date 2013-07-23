class Proposal < ActiveRecord::Base
  attr_accessible :text

  make_voteable
end
