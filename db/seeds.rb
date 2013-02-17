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
YAML.load(ENV['ROLES']).each do |role|
  Role.find_or_create_by_name({ :name => role }, :without_protection => true)
  puts 'role: ' << role
end
puts 'DEFAULT USERS'
user = User.find_or_create_by_email :name => ENV['ADMIN_NAME'].dup, :email => ENV['ADMIN_EMAIL'].dup, :password => ENV['ADMIN_PASSWORD'].dup, :password_confirmation => ENV['ADMIN_PASSWORD'].dup
puts 'user: ' << user.name
user.add_role :admin

ActiveRecord::Base.connection.execute("truncate table galleries RESTART IDENTITY;")

puts 'Default gallery contents'
pic = Gallery.create(fname: "flowerboxes.jpg", category: "x_country", thumbnail: "flowerboxes-thumb.jpg", caption: "Flower Boxes")
pic = Gallery.create(fname: "xc1.jpg", category: "x_country", thumbnail: "xc1-thumb.jpg", caption: "Flower Fence")
pic = Gallery.create(fname: "xc2.jpg", category: "x_country", thumbnail: "xc2-thumb.jpg", caption: "Fence 2")
