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

platform = whitespace.phase.ideas.create!(text: 'Need a web platform', user: sally, created_at: (Time.now + 1.day), accepted_at: (Time.now + 1.day + 1.hour))
platform.resources.create!(type: 'Software', user: user, name: 'Rails', description: 'Ruby on Rails is a breakthrough in lowering the barriers of entry to programming. Powerful web applications that formerly might have taken weeks or months to develop can be produced in a matter of days.', url: 'http://rubyonrails.org')
platform.comments.create!(text: 'Totally!', user: tim, created_at: (Time.now + 2.days))

app = whitespace.phase.ideas.create!(text: 'Need a mobile app!', user: james, created_at: (Time.now + 3.days))
app.resources.create!(type: 'Software', user: user, name: 'iOS App', description: 'iOS 7 introduces great new features like Control Center, AirDrop for iOS and smarter multitasking. It also makes the things you do every day even easier, faster and more enjoyable. And while many of the apps look different, the way you do things feels perfectly familiar. So from day one, you know how to use the world\'s most advanced mobile OS. In its most advanced form.', url: 'http://apple.com')
app.comments.create!(text: 'iOS?', user: tim, created_at: (Time.now + 4.days))
app.comments.create!(text: 'Yes! And Android!', user: james, created_at: (Time.now + 5.days))

whitespace.accept_phase

weekly = whitespace.phase.ideas.create!(text: 'Weekly meetings', user: sally, created_at: (Time.now + 6.days))
weekly.resources.create!(type: 'Software', user: user, name: 'Google Calendar', description: 'With Google\'s free online calendar, its easy to keep track of life\'s important events all in one place.', url: 'https://www.google.com/calendar')
weekly.comments.create!(text: 'We need some place to centrally organize info', user: tim, created_at: (Time.now + 7.days))
weekly.comments.create!(text: 'We need to be able to collaborate with those in different locations', user: sally, created_at: (Time.now + 8.days))

gdrive = whitespace.phase.ideas.create!(text: 'Use Google Drive and Github', user: james, created_at: (Time.now + 9.days), accepted_at: (Time.now + 9.days + 1.hour))
gdrive.resources.create!(type: 'Software', user: user, name: 'Google Drive', description: 'Google Drive is a free way to keep your files backed up and easy to reach from any phone, tablet, or computer.', url: 'https://docs.google.com')
gdrive.comments.create!(text: 'Google Drive is complicated', user: tim, created_at: (Time.now + 10.days))
gdrive.comments.create!(text: 'True, and not all projects need a code repo!', user: james, created_at: (Time.now + 11.days))

online_platform = whitespace.phase.ideas.create!(text: 'Online web platform', user: tim, created_at: (Time.now + 12.days))
online_platform.resources.create!(type: 'Software', user: user, name: 'WordPress', description: 'WordPress is a state-of-the-art semantic personal publishing platform with a focus on aesthetics, web standards, and usability.', url: 'http://wordpress.org')
online_platform.comments.create!(text: 'This sounds like it might actually work!', user: sally, created_at: (Time.now + 13.days))
online_platform.comments.create!(text: 'I love this!', user: james, created_at: (Time.now + 14.days))

whitespace.accept_phase
