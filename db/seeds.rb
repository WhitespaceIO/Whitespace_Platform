yxevotes = Project.create(name: 'YXE Votes', description: 'A social platform for the Saskatoon 2012 Civic Election sharing candidates and ward information.')
yxevotes.comments.create(:title => 'YXE Votes rocks!', :comment => 'Nice work on YXE Votes!')

yxevoices = Project.create(name: 'YXE Voices', description: 'A civic engagement platform to promote the sharing and discussion of ideas on ways to improve our city.')
yxevoices.comments.create(:title => 'YXE Voices is great!', :comment => 'Nice work on YXE Voices!')

pandobranches = Project.create(name: 'Pando Branches', description: 'Mapping the location of donated fruit trees to automate the workload for coordinating the harvest.')
pandobranches.comments.create(:title => 'Pando Branches rules!', :comment => 'Nice work on Pando Branches!')

storyproject = Project.create(name: 'Story Project', description: 'A story telling platform to share amazing life experiences that embraces the idea that everyone has a story to share.')
storyproject.comments.create(:title => 'Story Project will change the world!', :comment => 'Stories can change the world!')

smsproject = Project.create(name: 'SMS Project', description: 'Leveraging SMS as a platform to provide support services for vulnerable groups in our community.')
smsproject.comments.create(:title => 'SMS Project is cool!', :comment => 'SMS Project!')

healthmap = Project.create(name: 'Health Facility Map', description: 'Partnership with BongoHive to build a map of all the health facilities in Saskatchewan.')
healthmap.comments.create(:title => 'Health Facility Map is cool!', :comment => 'Nice work on Health Facility Map!')

repurposedlabs = Project.create(name: 'Repurposed Labs', description: 'Bridging the digital divide by repurposing used computers into free internet access terminals for disadvantaged communities.')
repurposedlabs.comments.create(:title => 'Repurposed Labs is cool!', :comment => 'Thanks for Repurposed Labs!')

votebecause = Project.create(name: 'I Vote Because', description: 'Pro-democracy movement to encourage Canadians to share why voting matters, why every voice counts.')
votebecause.comments.create(:title => 'I Vote Because', :comment => 'Thanks for I Vote Because :)')

User.create(:email => 'guest@whitespace.io', :password => 'password', :firstname => 'Guest', :lastname => 'Guest', :role => 'guest')
User.create(:email => 'user@whitespace.io', :password => 'password', :firstname => 'User', :lastname => 'User', :role => 'user')
User.create(:email => 'admin@whitespace.io', :password => 'password', :firstname => 'Admin', :lastname => 'Admin', :role => 'admin')