class CreateAddedCourses < ActiveRecord::Migration[5.2]
  def change
    create_table :added_courses do |t|
      t.integer :student_id
      t.integer :course_id
    end
  end
end
