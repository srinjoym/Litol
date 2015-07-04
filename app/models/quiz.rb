class Quiz < ActiveRecord::Base
  belongs_to :Chapter
  has_many :quiz_questions
  has_one :quiz_result
end
