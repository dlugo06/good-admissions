class CreateCohorts < ActiveRecord::Migration
  def change
    create_table :cohorts do |t|
      t.string :name
      t.string :location
      t.integer :cohort_number
      t.integer :capacity
      t.date :start_date

      t.timestamps null: false
    end
  end
end
