class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me

  make_voter

  has_many :comments
  has_many :resources

  def to_param
    [id, first_name.parameterize, last_name.parameterize].join('-')
  end

  def display_name
    "#{self.first_name} #{self.last_name}".strip
  end
end
