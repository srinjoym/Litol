require 'roo'
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
chapterSheet = Roo::Excelx.new("./app/assets/data/Chapters.xlsx")
chapterSheet.parse(:clean => true)
courseSheet = Roo::Excelx.new("./app/assets/data/Courses.xlsx")
courseSheet.parse(:clean => true)
sectionSheet = Roo::Excelx.new("./app/assets/data/Sections.xlsx")
sectionSheet.parse(:clean => true)
quizSheet = Roo::Excelx.new("./app/assets/data/Quizzes.xlsx")
quizSheet.parse(:clean => true)
quizQuestionSheet = Roo::Excelx.new("./app/assets/data/QuizQuestions.xlsx")
quizQuestionSheet.parse(:clean => true)
answerChoicesSheet = Roo::Excelx.new("./app/assets/data/AnswerChoices.xlsx")
answerChoicesSheet.parse(:clean => true)


courseSheet.each_row_streaming do |row|
  Course.create!(name: row[0].value, description: row[1].value, imageSource:row[2].value, default:row[3].value)
end
chapterSheet.each_row_streaming do |row|
  Chapter.create!(id:row[0].value,name:row[1].value, overview:row[2].value, course_id:row[3].value, order: row[4].value)
end
sectionSheet.each_row_streaming do |row|
  Section.create!(name:row[0].value, content:row[1].value, contentType:row[2].value, chapter_id: row[3].value,order: row[4].value)
end
quizSheet.each_row_streaming do |row|
  Quiz.create!(id:row[0].value, name:row[1].value, chapter_id:row[2].value)
end
quizQuestionSheet.each_row_streaming do |row|
  question=QuizQuestion.create!(id:row[0].value, quiz_id:row[1].value, question:row[2].value, correct_answer: row[3].value)
  if !row[4].nil?
    question.imgSource  = row[4].value
    question.save
  end
end
answerChoicesSheet.each_row_streaming do |row|
  AnswerChoice.create!(id:row[0].value, quiz_question_id:row[1].value, answer:row[2].value, letter: row[3].value)
end