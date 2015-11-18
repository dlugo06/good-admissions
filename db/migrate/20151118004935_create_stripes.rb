class CreateStripes < ActiveRecord::Migration
  def change
    create_table :stripes do |t|
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
