class QuizQuestion < ActiveRecord::Base
  belongs_to :Quiz
  has_many :answer_choices
end
