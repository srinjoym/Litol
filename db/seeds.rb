# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Course.create!(name:  "Example Course",
             description: "Best course on the internet",
             imageSource:"Course2.png")

5.times do |n|
  name  = Faker::Name.name
  description = "Best course on the internet"
  imageSource = "Course"+n.to_s+".png"
  Course.create!(name:  name,
               description: description,
               imageSource: imageSource)
end


5.times do |n|
  order=n+1
  name  = "Chapter "+(n+1).to_s
  overview = ((n+1).ordinalize) + " Chapter"
  course_id = 1
  Chapter.create!(name:  name,
                 order: order,
                 overview: overview,
                  course_id:course_id)
end

Section.create!(name:  "機率 (Probability) with 葉丙成 Ping-Cheng Yeh (Benson)",

                content: "https://www.youtube.com/watch?v=XtPryPyT3I0&list=PLVext98k2evjQVYqA3oponW9ySF5GWTs9",
                contentType:"vid",
                chapter_id:Chapter.first.id)
