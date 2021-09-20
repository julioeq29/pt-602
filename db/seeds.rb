require 'nokogiri'
require 'json'
require 'open-uri'


###########################################################
############# Getting GitHub Usernames ####################
###########################################################

html_file = File.open('./public/batch_602.html')
html_doc = Nokogiri::HTML(html_file)

students_array = []
html_doc.search('.col-12 a').each do |element|
  user_string = element.attribute('href').value
  unless user_string.match(/^(\D(alumni)\D)(\w*)$/).nil?
    match_data = user_string.match(/^(\D(alumni)\D)(\w*)$/)
    students_array << match_data[3]
  end
end
puts students_array

############################################################
############################################################


############################################################
#################### Seeding PT 476 ########################
############################################################

# Student.destroy_all
# Project.destroy_all

puts 'Starting seed'

project = Project.create!(name: 'Markdown Prediction',
                url: 'https://markdown-predictions-602.herokuapp.com/',
                description: 'Machine Learning to find ideal markdown for a clothing company using data from 7 seasons')
Student.create!(github: 'J-Cancelliere', project: project)
Student.create!(github: 'indiarosefriswell', project: project)
Student.create!(github: 'janagarina', project: project)
Student.create!(github: 'sullivan-a-james', project: project)


project = Project.create!(name: 'Droguth Modelling',
                url: 'https://drought-y2frup7noq-ew.a.run.app/',
                description: 'Predict drought levels in the US using 20 years of data')
Student.create!(github: 'Jack-Hooper', project: project)
Student.create!(github: 'HughLupson', project: project)
Student.create!(github: 'realGhostFoxx', project: project)


project = Project.create!(name: 'Violence Detection',
                url: 'https://service-i472ew26aa-ew.a.run.app/',
                description: 'Using computer vision to detect violent behaviour in videos')
Student.create!(github: 'Gifta-eng', project: project)
Student.create!(github: 'lukas-pham', project: project)
Student.create!(github: 'dsenanayake95', project: project)


project = Project.create!(name: 'Brain Imaging',
                url: '',
                description: 'Detecting personality traits using brain measurement data')
Student.create!(github: 'fcostaduarte', project: project)
Student.create!(github: 'cholmess', project: project)
Student.create!(github: 'lukevano', project: project)


project = Project.create!(name: 'Good Sleep',
                url: 'https://sleepapp-lh5u53p2cq-ew.a.run.app/',
                description: 'Finding the most important predictors for getting Good Sleep')
Student.create!(github: 'Al-Catto', project: project)
Student.create!(github: 'mnm7', project: project)
Student.create!(github: 'pandit-a', project: project)
Student.create!(github: 'richrussell1991', project: project)


# project = Project.create!(name: 'Turn Up',
#                 url: 'http://www.turn-up-london.com/',
#                 description: 'Turn a card and turn up')
# Student.create!(github: 'MirandaFrudd', project: project)
# Student.create!(github: 'Catfuj', project: project)
# Student.create!(github: 'JessicaTopley', project: project)
# Student.create!(github: 'Temceo', project: project)


# project = Project.create!(name: 'Find Mike',
#                 url: 'https://www.findmike.co.uk/',
#                 description: 'Your one-stop-shop for Open Mic comedy.')
# Student.create!(github: 'Freddie-Fryer', project: project)
# Student.create!(github: 'FelicityTowler', project: project)
# Student.create!(github: 'chrisbellairs', project:project)
# Student.create!(github: 'the-real-woody', project:project)


# project = Project.create!(name: 'How\'s It Growing?',
#                 url: 'http://www.hows-it-growing.com/',
#                 description: 'Start your own plant patch from scratch!')
# Student.create!(github: 'Schemalem', project: project)
# Student.create!(github: 'Alexr788', project: project)
# Student.create!(github: 'maraskowa', project: project)
# Student.create!(github: 'Razvan-Neda', project: project)


# project = Project.create!(name: 'SPOT',
#                 url: 'https://www.spot-476.com/',
#                 description: 'Revolutionise the personal training space')
# Student.create!(github: 'odayadli', project: project)
# Student.create!(github: 'Gillis247', project: project)
# Student.create!(github: 'Robertolns', project: project)
# Student.create!(github: 'gelllery2395', project: project)


# project = Project.create!(name: 'Up in the air',
#                 url: 'http://www.upintheair.io/',
#                 description: 'Easily arrange a group trip, even when everyone comes from different cities')
# Student.create!(github: 'rachel-herlihy', project: project)
# Student.create!(github: 'akilchomoko', project: project)
# Student.create!(github: 'WaynePatrickDalton', project: project)
# Student.create!(github: 'gtm19', project: project)


# project = Project.create!(name: 'batch 0')
# Student.create!(github: 'trock111jomy', project: project)

############################################################
############################################################


###########################################################
############### Getting GitHub Avatars ####################
###########################################################

Student.all.each do |s|
  url = "https://api.github.com/users/#{s.github}"
  s_serialized = open(url).read
  s_info = JSON.parse(s_serialized)
  s.avatar_url = s_info['avatar_url']
  p s.avatar_url
  s.name = s_info['name']
  s.save
  sleep 5
end

############################################################
############################################################


###########################################################
################# Getting GitHub TAs ######################
###########################################################

puts 'Seeding TAs'

html_file = File.open('./public/calendar_602.html')
html_doc = Nokogiri::HTML(html_file)

html_doc.search('.js-teacher-card').each do |element|
  ta = Teacher.new()
  ta_name = element.search('.calendar-card-info-teacher-link').text.strip
  ta_avatar = element.search('.calendar-card-avatar img').attribute('src').value
  ta.name = ta_name
  ta.avatar_url = ta_avatar

  ta_github = element.search('.calendar-card-info-teacher-link').attribute('href').value
  unless ta_github.match(/^(\D(alumni)\D)(\S*)\//).nil?
    match_data = ta_github.match(/^(\D(alumni)\D)(\S*)\//)
    p match_data[3]
    ta.github = match_data[3]
  end
  ta.save!
end
# puts ta_array

############################################################
############################################################


############################################################
################## Getting Staff ######################
############################################################

puts 'Seeding Staff'

html_file = File.open('./public/staff_q3_21.html')
html_doc = Nokogiri::HTML(html_file)

html_doc.search('.city-staff .item').each do |element|
  staff = Staff.new()
  staff_name = element.search('.full-name').text.strip
  unless staff_name.empty?
    staff_avatar = element.search('.item-picture img').attribute('data-src').value
    staff.name = staff_name
    staff.avatar_url = staff_avatar
    staff.save!
  end
end

############################################################
############################################################


puts 'Seeded'
