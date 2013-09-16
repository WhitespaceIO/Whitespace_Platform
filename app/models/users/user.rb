class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :confirmable

  attr_accessible :first_name, :last_name, :email, :password, :password_confirmation, :remember_me

  has_many :comments
  has_many :resources

  make_voter

  def to_param
    params = [id]
    if !first_name.blank?
      params.push first_name.parameterize
    elsif !last_name.blank?
      params.push last_name.parameterize
    end
    params.join('-')
  end

  def display_name
    "#{self.first_name} #{self.last_name}".strip
  end

end
