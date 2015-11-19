class AddCohortNumberToStudents < ActiveRecord::Migration
  def change
    add_column :students, :cohort_number, :integer
    add_index :students, :cohort_number
  end
end
