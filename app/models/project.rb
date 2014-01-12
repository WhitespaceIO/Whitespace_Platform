class Project < ActiveRecord::Base
  after_create :init
  attr_accessible :name, :description, :state, :comments_attributes, :created_at, :updated_at

  has_many :phases, dependent: :destroy
  has_many :comments, dependent: :destroy, as: :commentable
  has_many :taggings, dependent: :destroy, :as => :taggable
  has_many :tags, :through => :taggings
  has_many :locations

  validates :name, presence: true

  acts_as_voteable

  state_machine :initial => :problem, :namespace => 'phase' do

    event :start do
      transition all => :problem
    end

    event :accept do
      transition :problem => :solution,
                 :solution => :technology,
                 :technology => :partner,
                 :partner => :funding,
                 :funding => :design,
                 :design => :develop,
                 :develop => :deploy,
                 :deploy => :evaluate
    end

    event :reject do
      transition :solution => :problem,
                 :technology => :solution,
                 :partner => :technology,
                 :funding => :partner,
                 :design => :funding,
                 :develop => :design,
                 :deploy => :develop,
                 :evaluate => :deploy
    end

    before_transition :on => :start do |project|
      project.phases.update_all :started_at => nil
      project.phases.update_all :completed_at => nil
      project.phase.update_attribute :started_at, Time.now
    end

    before_transition :on => :accept do |project|
      project.phase.update_attribute :completed_at, Time.now
    end

    after_transition :on => :accept do |project|
      project.phase.update_attribute :started_at, Time.now
    end

    state :problem
    state :solution
    state :technology
    state :partner
    state :funding
    state :design
    state :develop
    state :deploy
    state :evaluate
  end

  def phase
    self.phases.where(:completed_at => nil).first
  end

  def to_param
    [id, name.parameterize].join('-')
  end

  def init
    self.phases << Problem.new
    self.phases << Solution.new
    self.phases << Technology.new
    self.phases << Partner.new
    self.phases << Funding.new
    self.phases << Design.new
    self.phases << Develop.new
    self.phases << Deploy.new
    self.phases << Evaluate.new
    self.start_phase
  end

end
