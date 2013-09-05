class User < ActiveRecord::Base

  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :role, :firstname, :lastname, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  make_voter

  ROLES = %w[guest user admin]

  def role?(role)
    Rails.logger.debug "#{self.role} == #{role}"
    self.role == role.to_s
  end

  def to_param
    [id].join("-")
    #[id, firstname.parameterize, lastname.parameterize].join("-")
  end

end
