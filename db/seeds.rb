date_time1 = DateTime.new(2018, 11, 27, 9)
date_time2 = DateTime.new(2018, 11, 27, 11)


todd = User.create(name: "Todd", email: "todd@todd.com", password_digest: "password")
archer = User.create(name: "Archer", email: "archer@archer.com", password_digest: "password")

ruby = Group.create(name: "Ruby")
sinatra = Group.create(name: "Sinatra")
rails = Group.create(name: "Rails")

meeting = Event.create(user_id: todd.id, description: "Meeting", start_time: date_time1.hour, end_time: date_time1.hour+1)

study_group = Event.create(user_id: archer.id, description: "Study Group", start_time: date_time2.hour, end_time: date_time2.hour+1)
