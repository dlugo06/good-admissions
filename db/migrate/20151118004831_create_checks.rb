class CreateChecks < ActiveRecord::Migration
  def change
    create_table :checks do |t|
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
