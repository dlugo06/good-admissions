class AddFieldsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :facebook, :string
    add_column :students, :twitter, :string
    add_column :students, :linkedin, :string
    add_column :students, :github, :string
    add_column :students, :portfolio_url, :string
    add_column :students, :final_project_url, :string
  end
end
