Dir[Rails.root.join('app', 'models', 'phases', '{**}')].each do |role|
  require_dependency role
end
Dir[Rails.root.join('app', 'models', 'resources', '{**}')].each do |user|
  require_dependency user
end
Dir[Rails.root.join('app', 'models', 'users', '{**}')].each do |user|
  require_dependency user
end