class User < ActiveRecord::Base
  # :token_authenticatable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  attr_accessible :role, :first_name, :last_name, :email, :password, :password_confirmation, :remember_me

  has_many :comments
  has_many :resources

  make_voter

  ROLES = %w[guest user admin]

  def role?(role)
    Rails.logger.debug "#{self.role} == #{role}"
    self.role == role.to_s
  end

  def to_param
    [id].join("-")
    #[id, first_name.parameterize, last_name.parameterize].join("-")
  end

  def display_name()
    "#{self.first_name} #{self.last_name}".strip
  end
end
