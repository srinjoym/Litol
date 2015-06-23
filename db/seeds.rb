# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Course.create!(name:  "Example Course",
#              description: "Best course on the internet",
#              imageSource:"Course2.png")
#

Course.create!(name:  "Crash Course Astronomy",
               description: "A guided tour of the entire universe.",
               imageSource: "assets/Course1.png")

4.times do |n|
  name  = Faker::Name.name
  description = "Best course on the internet"
  imageSource = "Course"+n.to_s+".png"
  Course.create!(name:  name,
               description: description,
               imageSource: imageSource)
end

Chapter.create!(name:  "Astronomy Chapter 1",
                order: 1,
                overview: "Astronomy Basics",
                course_id:Course.first.id)

5.times do |n|
  order=n+2
  name  = "Chapter "+(n+2).to_s
  overview = ((n+2).ordinalize) + " Chapter"
  course_id = Course.first.id
  Chapter.create!(name:  name,
                 order: order,
                 overview: overview,
                  course_id:course_id)
end



Section.create!(name:  "Introduction to Astronomy: Crash Course Astronomy #1",

                content: "https://www.youtube.com/embed/0rHUDWjR5gg?list=PL8dPuuaLjXtPAJr1ysd5yGIyiSFuh0mIL",
                contentType:"vid",
                chapter_id:Chapter.first.id,order:1)

Section.create!(name:  "Naked Eye Observations: Crash Course Astronomy #2",

                content: "https://www.youtube.com/embed/L-Wtlev6suc?list=PL8dPuuaLjXtPAJr1ysd5yGIyiSFuh0mIL",
                contentType:"vid",
                chapter_id:Chapter.first.id,order:2)
Section.create!(name:  "Cycles in the Sky: Crash Course Astronomy #3",

                content: "https://www.youtube.com/embed/01QWC-rZcfE?list=PL8dPuuaLjXtPAJr1ysd5yGIyiSFuh0mIL",
                contentType:"vid",
                chapter_id:Chapter.first.id,order:3)
Section.create!(name:  "Moon Phases: Crash Course Astronomy #4",

                content: "https://www.youtube.com/embed/AQ5vty8f9Xc?list=PL8dPuuaLjXtPAJr1ysd5yGIyiSFuh0mIL",
                contentType:"vid",
                chapter_id:Chapter.first.id,order:4)
Section.create!(name:  "Eclipses: Crash Course Astronomy #5",

                content: "https://www.youtube.com/embed/PRgua7xceDA?list=PL8dPuuaLjXtPAJr1ysd5yGIyiSFuh0mIL",
                contentType:"vid",
                chapter_id:Chapter.first.id,order:5)
