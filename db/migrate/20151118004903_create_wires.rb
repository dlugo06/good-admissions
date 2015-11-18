class CreateWires < ActiveRecord::Migration
  def change
    create_table :wires do |t|
      t.references :student, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
