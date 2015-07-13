class Course < ActiveRecord::Base
 has_many :chapters
 has_many :quiz_results
 has_and_belongs_to_many :organizations
end
