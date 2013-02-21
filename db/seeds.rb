# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) are set in the file config/application.yml.
# See http://railsapps.github.com/rails-environment-variables.html

ActiveRecord::Base.connection.execute("truncate table users RESTART IDENTITY;")


puts 'ROLES'
#YAML.load(ENV['ROLES']).each do |role|
#  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
#  puts 'role: ' << role
#end
Role.find_or_create_by_name({ :name => "admin" }, :without_protection => true)
Role.find_or_create_by_name({ :name => "guest" }, :without_protection => true)
puts "roles created..."

puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.add_role :admin
user = User.find_or_create_by_email :name => "Cindy", :email => "genevaequestrian@msn.com", :password => "password", :password_confirmation => "password"
puts 'user: ' << user.name
user.add_role :admin

ActiveRecord::Base.connection.execute("truncate table galleries RESTART IDENTITY;")

#puts 'x country gallery contents'
#pic = Gallery.create(fname: "flowerboxes.jpg", category: "x_country", thumbnail: "flowerboxes-thumb.jpg", caption: "Flower Boxes")
#pic = Gallery.create(fname: "xc1.jpg", category: "x_country", thumbnail: "xc1-thumb.jpg", caption: "Flower Fence")
#pic = Gallery.create(fname: "xc2.jpg", category: "x_country", thumbnail: "xc2-thumb.jpg", caption: "Fence 2")
#
#puts 'facility gallery contents'
#pic = Gallery.create(fname: "facility1.jpg", category: "facility", thumbnail: "facility1-thumb.jpg", caption: "caption1")
#pic = Gallery.create(fname: "facility2.jpg", category: "facility", thumbnail: "facility2-thumb.jpg", caption: "caption2")
#pic = Gallery.create(fname: "facility3.jpg", category: "facility", thumbnail: "facility3-thumb.jpg", caption: "caption3")
#pic = Gallery.create(fname: "facility4.jpg", category: "facility", thumbnail: "facility4-thumb.jpg", caption: "caption4")
#
puts 'clinic documents'
doc = Gallery.create(fname: "bh_entry_form.doc", category: "clinic_docs", thumbnail: "document.jpg", caption: "Brad Hall Entry Registration Form")
doc = Gallery.create(fname: "hold_harmless.doc", category: "clinic_docs", thumbnail: "document.jpg", caption: "Hold Harmless Form")
doc = Gallery.create(fname: "medical_auth.doc", category: "clinic_docs", thumbnail: "document.jpg", caption: "Medical Authorization Form")


ActiveRecord::Base.connection.execute("truncate table events RESTART IDENTITY;")

#puts 'clinic events'
#event = Event.create(category: "clinic", name: "an event title", date_and_time: DateTime.now, description: "a description for the event...")

