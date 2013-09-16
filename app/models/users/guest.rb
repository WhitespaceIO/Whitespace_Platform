class Guest < User

  def display_name
    'Guest'
  end

  def self.model_name
    User.model_name
  end
end