# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Demo Database
User.destroy_all
Project.destroy_all
Picture.destroy_all


puts "Seeding Admin user Doug"
doug = User.new({
    email: "teixeir3@gmail.com",
    first_name: "Douglas",
    last_name: "Teixeira",
    phone: "908-872-0937",
    password: ENV["DEVELOPER_PASSWORD"],
    bio: "<p>I  graduated in 2011 with a B.S. in Business Administration with specializations in marketing and a minor in psychology. In school, I enjoyed my computer science classes such as Advanced Programming in Java, and have since taught myself web development with the help of AppAccademy.io</p>

<p>At age 22, I co-founded a health IT consulting company where I was able to dable in web development through website builders such as squarespace.com. When I quickly felt limited by site builders, I taught myself full-stack web development and fell in love.</p>

<p>Besides web development, I have a passion for traveling, cooking, and culture. I love learning and exploring new things, be it trying a new programming language or discovering the culture in a new city, exploration is in my blood!</p>",
    display: true,
    position: 0,
    title: "Software Engineer",
    is_active: true,
    is_admin: true
  })
  
puts "Seeding Projects"
project = doug.projects.build({
  title: "Asteroids",
  url: "http://DougTeixeira.com/asteroids",
  source_url: "https://github.com/teixeir3/asteroids",
  description: "Browser version of classic arcade game Asteroids, written in Javascript and packaged into a ruby gem for easy inclusion in rails projects.",
  ord: 0,
  display: true
})

picture = project.pictures.build({
  
})

doug.save!