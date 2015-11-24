class AddDiscountToStudents < ActiveRecord::Migration
  def change
    add_column :students, :discount, :decimal, default: 0
    add_column :students, :notes, :text
  end
end
