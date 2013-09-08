class Phase < ActiveRecord::Base
  attr_accessible :name, :description, :state, :ordinal, :started_at, :completed_at

  belongs_to :project

  has_many :proposals
  has_many :comments, as: :commentable
  has_many :taggings, :as => :taggable
  has_many :tags, :through => :taggings

  validates :name, presence: true

  state_machine :initial => :pending do

    event :start do
      transition all => :started
    end

    event :complete do
      transition :started => :completed, :if => lambda {|phase| phase.completed_at.nil?}
    end

    after_transition any => :pending do |phase|
      Rails.logger.info "Project #{phase.project.name} Phase #{phase.name} Pending"
      phase.update_attributes :started_at => pending,
                              :completed_at => nil
    end

    after_transition any => :started do |phase|
      Rails.logger.info "Project #{phase.project.name} Phase #{phase.name} Started"
      phase.update_attributes :started_at => Time.now,
                              :completed_at => nil
    end

    after_transition any => :completed do |phase|
      Rails.logger.info "Project #{phase.project.name} Phase #{phase.name} Completed"
      phase.update_attributes :completed_at => Time.now
    end

    state :pending
    state :started
    state :completed
  end

  def to_param
    [id, name.parameterize].join('-')
  end
end
