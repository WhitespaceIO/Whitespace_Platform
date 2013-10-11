class Project < ActiveRecord::Base
  after_create :init
  attr_accessible :description, :name, :state, :comments_attributes

  has_many :phases, dependent: :destroy
  has_many :comments, dependent: :destroy, as: :commentable
  has_many :taggings, dependent: :destroy, :as => :taggable
  has_many :tags, :through => :taggings
  has_many :locations

  validates :name, presence: true

  acts_as_voteable

  def initialize(*)
    super
    action
  end

  def phase
    project = self
    @action ||= Action.new(project, :initial => :problem, :action => :save) do
      project.transitions.each {|attrs| transition(attrs)}
    end
  end

  def transitions
    transitions_data = []
    self.phases.sort_by {|p| p.ordinal }.each_cons(2) do |a, b|
      transitions_data << { a.name.downcase.to_sym => b.name.downcase.to_sym, :on => 'accept'.to_sym }
      transitions_data << { b.name.downcase.to_sym => a.name.downcase.to_sym, :on => 'reject'.to_sym }
    end
    transitions_data
  end

  def to_param
    [id, name.parameterize].join('-')
  end

  def init
    #TODO move this into config file
    action
    if self.phases.empty?
      self.phases.create(name: 'Problem', description: 'What is the root problem?', ordinal: 1)
      self.phases.create(name: 'Solution', description: 'What is a practical solution?', ordinal: 2)
      self.phases.create(name: 'Technology', description: 'What is an appropriate technology?', ordinal: 3)
      self.phases.create(name: 'Partner', description: 'Are there local partners?', ordinal: 4)
      self.phases.create(name: 'Funding', description: 'Does the project require funding?', ordinal: 5)
      self.phases.create(name: 'Design', description: 'What is the initial design?', ordinal: 6)
      self.phases.create(name: 'Prototype', description: 'What is basic prototype?', ordinal: 7)
      self.phases.create(name: 'Develop', description: 'What needs to be developed?', ordinal: 8)
      self.phases.create(name: 'Deploy', description: 'How is the project deployed?', ordinal: 9)
      self.phases.create(name: 'Test', description: 'Does the solution solve the problem?', ordinal: 10)
    end
  end
end
