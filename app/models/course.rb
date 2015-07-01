class Course < ActiveRecord::Base
 has_many :chapters
 has_and_belongs_to_many :organizations
end
