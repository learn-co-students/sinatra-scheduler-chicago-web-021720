class Schedule < ActiveRecord::Base
    has_many :added_courses
    has_many :courses, through: :added_courses

    def total_credits
        credits = self.courses.collect {|course| course.credits}
        credits.sum
    end
end