class Project < ActiveRecord::Base
  after_create :init
  attr_accessible :description, :name, :comments_attributes
  has_many :phases, dependent: :destroy

  validates :name, presence: true

  make_voteable
  acts_as_commentable

  def to_param
    [id, name.parameterize].join("-")
  end

  def init
    #TODO move this into config file
    if self.phases.empty?
      self.phases.create(name: 'Problem', ordinal: 1)
      self.phases.create(name: 'Solution', ordinal: 2)
      self.phases.create(name: 'Technology', ordinal: 3)
      self.phases.create(name: 'Funding', ordinal: 4)
      self.phases.create(name: 'Team', ordinal: 5)
      self.phases.create(name: 'Design', ordinal: 6)
      self.phases.create(name: 'Prototype', ordinal: 7)
      self.phases.create(name: 'Develop', ordinal: 8)
      self.phases.create(name: 'Deploy', ordinal: 9)
    end
  end
end
