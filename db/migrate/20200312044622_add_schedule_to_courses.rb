class AddScheduleToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :schedule, :boolean
  end
end
