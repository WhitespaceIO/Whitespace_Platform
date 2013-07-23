# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

project = Project.create(name: 'Project One', description: 'This is project one.')
project.comments.create(:title => "Nice project!", :comment => "Nice project buddy.")

problem = project.phases.create(name: 'Problem', ordinal: 1)
problem.comments.create(:title => "What's the problem?", :comment => "That's the problem man?!")

project.phases.create(name: 'Solution', ordinal: 2)
project.phases.create(name: 'Technology', ordinal: 3)
project.phases.create(name: 'Funding', ordinal: 4)
project.phases.create(name: 'Team', ordinal: 5)
project.phases.create(name: 'Design', ordinal: 6)
project.phases.create(name: 'Prototype', ordinal: 7)
project.phases.create(name: 'Develop', ordinal: 8)
project.phases.create(name: 'Deploy', ordinal: 9)