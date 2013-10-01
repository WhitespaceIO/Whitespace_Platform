# Members
james = Member.new(:email => 'james@whitespace.io', :password => 'password', :first_name => 'James', :last_name => 'McNab')
james.skip_confirmation!
james.save

sally = Member.new(:email => 'sally@whitespace.io', :password => 'password', :first_name => 'Sally', :last_name => 'Foghart')
sally.skip_confirmation!
sally.save

tim = Member.new(:email => 'tim@whitespace.io', :password => 'password', :first_name => 'Tim', :last_name => 'Smith')
tim.skip_confirmation!
tim.save

member = Member.new(:email => 'member@whitespace.io', :password => 'password', :first_name => Member.name, :last_name => '')
member.skip_confirmation!
member.save

user = Member.new(:email => 'user@whitespace.io', :password => 'password', :first_name => User.name, :last_name => '')
user.skip_confirmation!
user.save

admin = Admin.new(:email => 'admin@whitespace.io', :password => 'password', :first_name => Admin.name, :last_name => '')
admin.skip_confirmation!
admin.save


# Projects
yxevotes = Project.create(name: 'YXE Votes', description: 'A social platform for the Saskatoon 2012 Civic Election sharing candidates and ward information.')
yxevotes.locations.create(city: 'Saskatoon', state: 'Saskatchewan', country: 'Canada')
yxevotes.tags.create(name: 'election')
yxevotes.tags.create(name: 'civic')
yxevotes.comments.create(text: 'Nice work on YXE Votes!')

yxevoices = Project.create(name: 'YXE Voices', description: 'A civic engagement platform to promote the sharing and discussion of ideas on ways to improve our city.')
yxevoices.locations.create(city: 'Saskatoon', state: 'Saskatchewan', country: 'Canada')
yxevoices.tags.create(name: 'civic')
yxevoices.comments.create(:text => 'Nice work on YXE Voices!')

pandobranches = Project.create(name: 'Pando Branches', description: 'Mapping the location of donated fruit trees to automate the workload for coordinating the harvest.')
pandobranches.locations.create(city: 'Saskatoon', state: 'Saskatchewan', country: 'Canada')
pandobranches.comments.create(text: 'Nice work on Pando Branches!')

storyproject = Project.create(name: 'Story Project', description: 'A story telling platform to share amazing life experiences that embraces the idea that everyone has a story to share.')
storyproject.tags.create(name: 'community')
storyproject.comments.create(text: 'Stories can change the world!')

smsproject = Project.create(name: 'SMS Project', description: 'Leveraging SMS as a platform to provide support services for vulnerable groups in our community.')
smsproject.tags.create(name: 'health')
smsproject.comments.create(text: 'SMS Project!')

healthmap = Project.create(name: 'Health Facility Map', description: 'Partnership with BongoHive to build a map of all the health facilities in Saskatchewan.')
healthmap.tags.create(name: 'health')
healthmap.comments.create(text: 'Nice work on Health Facility Map!')

repurposedlabs = Project.create(name: 'Repurposed Labs', description: 'Bridging the digital divide by repurposing used computers into free internet access terminals for disadvantaged communities.')
repurposedlabs.locations.create(city: 'Saskatoon', state: 'Saskatchewan', country: 'Canada', name: 'White Buffalo', latitude: 52.126107, longitude: -106.674864)
repurposedlabs.locations.create(city: 'Saskatoon', state: 'Saskatchewan', country: 'Canada', name: 'CBYC', latitude: 52.125912, longitude: -106.678652)
repurposedlabs.tags.create(name: 'community')
repurposedlabs.comments.create(text: 'Thanks for Repurposed Labs!')

votebecause = Project.create(name: 'I Vote Because', description: 'Pro-democracy movement to encourage Canadians to share why voting matters, why every voice counts.')
votebecause.tags.create(name: 'election')
votebecause.comments.create(text: 'Thanks for I Vote Because :)')

# Whitespace dogfood project :)
whitespace = Project.create(name: 'Whitespace Platform', description: 'A social platform to get people openly collaborating over projects they\'re  technically unable to tackle solo.')
whitespace.locations.create(city: 'Saskatoon', state: 'Saskatchewan', country: 'Canada')
whitespace.tags.create(name: 'social')
whitespace.tags.create(name: 'better good')
whitespace.tags.create(name: 'empowerment')

whitespace_problem_phase = Phase.find(73)
whitespace_problem_phase.started_at = '2013-08-01 05:25:46'
whitespace_problem_phase.completed_at = '2013-09-01 05:25:46'
whitespace_problem_phase.state = :completed
whitespace_problem_phase.save

whitespace_solution_phase = Phase.find(74)
whitespace_solution_phase.started_at = '2013-09-01 05:25:46'
whitespace_solution_phase.state = :started
whitespace_solution_phase.save

weekly = whitespace_solution_phase.ideas.create!(text: 'Weekly meetings and Facebook messenger', user: sally, created_at: '2013-09-05 05:25:46')
weekly.comments.create!(text: 'We need some place to centrally organize info', user: tim, created_at: '2013-09-05 10:25:46')
weekly.comments.create!(text: 'We need to be able to collaborate with those in different locations', user: sally, created_at: '2013-09-05 10:25:46')

gdrive = whitespace_solution_phase.ideas.create!(text: 'Use Google Drive and Github', user: james, created_at: '2013-09-10 05:25:46')
gdrive.comments.create!(text: 'Google Drive is complicated', user: tim, created_at: '2013-09-11 05:25:46')
gdrive.comments.create!(text: 'True, and not all projects need a code repo!', user: james, created_at: '2013-09-12 05:25:46')

online_platform = whitespace_solution_phase.ideas.create!(text: 'Online web platform', user: tim, created_at: '2013-09-15 05:25:46')
online_platform.comments.create!(text: 'This sounds like it might actually work!', user: sally, created_at: '2013-09-25 05:25:46')
online_platform.comments.create!(text: 'I love this!', user: james, created_at: '2013-09-17 05:25:46')
