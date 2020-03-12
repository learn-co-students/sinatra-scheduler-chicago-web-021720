class Course < ActiveRecord::Base
    def self.current_credits
        sch_courses = self.all.select do |c|
            c.schedule
        end
        total = 0 
        sch_courses.each do |c|
            total += c.credits
        end 
        total
    end


end 