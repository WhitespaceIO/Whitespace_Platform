class Phase < ActiveRecord::Base
  attr_accessible :name, :description, :ordinal, :started_at, :completed_at
  belongs_to :project
  has_many :proposals

  validates :name, presence: true

  acts_as_commentable

  def to_param
    [id, name.parameterize].join("-")
  end
end
