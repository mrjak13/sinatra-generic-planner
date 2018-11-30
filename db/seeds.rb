
todd = User.create(name: "Todd", email: "todd@todd.com", password: "password")
archer = User.create(name: "Archer", email: "archer@archer.com", password: "password")
bob = User.create(name: "bob", email: "bob@bob.com", password: "password")
admin = User.create(name: "admin", email: "admin@admin.com", password: "admin")

ruby = Group.create(name: "Ruby")
sinatra = Group.create(name: "Sinatra")
rails = Group.create(name: "Rails")
general = Group.create(name: "General")
