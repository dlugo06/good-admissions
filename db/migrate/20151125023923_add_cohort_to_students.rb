class AddCohortToStudents < ActiveRecord::Migration
  def change
    add_reference :students, :cohort, index: true, foreign_key: true
  end
end
