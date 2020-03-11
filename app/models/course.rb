class Course < ActiveRecord::Base
    has_many :added_courses
    has_many :schedules, through: :added_courses
end