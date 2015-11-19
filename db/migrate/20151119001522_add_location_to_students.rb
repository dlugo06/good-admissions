class AddLocationToStudents < ActiveRecord::Migration
  def change
    add_column :students, :location, :string
    add_index :students, :location
  end
end
