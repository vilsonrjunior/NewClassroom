class AddEndDateToCourses < ActiveRecord::Migration[5.1]
  def change
    add_column :courses, :end_date, :datetime
  end
end
