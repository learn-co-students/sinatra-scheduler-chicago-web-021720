class AddScheduleColumnToAddedCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :added_courses, :schedule_id, :integer
    remove_column :added_courses, :student_id, :integer
  end
end
