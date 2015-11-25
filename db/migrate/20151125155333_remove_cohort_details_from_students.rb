class RemoveCohortDetailsFromStudents < ActiveRecord::Migration
  def up
    remove_column :students, :location
    remove_column :students, :cohort_number
  end

  def down
    add_column :students, :cohort_number, :integer
    add_column :students, :location, :string
  end
end
