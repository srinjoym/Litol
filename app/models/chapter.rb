class Chapter < ActiveRecord::Base
  belongs_to :course
  has_many :sections
  has_one :quiz

end
