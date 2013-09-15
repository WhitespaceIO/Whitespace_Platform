yxevotes = Project.create(name: 'YXE Votes', description: 'A social platform for the Saskatoon 2012 Civic Election sharing candidates and ward information.')
yxevotes.tags.create(name: 'election')
yxevotes.tags.create(name: 'civic')
yxevotes.comments.create(text: 'Nice work on YXE Votes!')

yxevoices = Project.create(name: 'YXE Voices', description: 'A civic engagement platform to promote the sharing and discussion of ideas on ways to improve our city.')
yxevoices.tags.create(name: 'civic')
yxevoices.comments.create(:text => 'Nice work on YXE Voices!')

pandobranches = Project.create(name: 'Pando Branches', description: 'Mapping the location of donated fruit trees to automate the workload for coordinating the harvest.')
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
repurposedlabs.tags.create(name: 'community')
repurposedlabs.comments.create(text: 'Thanks for Repurposed Labs!')

votebecause = Project.create(name: 'I Vote Because', description: 'Pro-democracy movement to encourage Canadians to share why voting matters, why every voice counts.')
votebecause.tags.create(name: 'election')
votebecause.comments.create(text: 'Thanks for I Vote Because :)')

member = Member.new(:email => 'member@whitespace.io', :password => 'password', :first_name => Member.name, :last_name => '')
member.skip_confirmation!
member.save

admin = Admin.new(:email => 'admin@whitespace.io', :password => 'password', :first_name => Admin.name, :last_name => '')
admin.skip_confirmation!
admin.save