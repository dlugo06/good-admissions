class ChangeAmountColumnsOnLoansAndWires < ActiveRecord::Migration
  def change
    change_column :loans, :amount, :decimal, precision: 10, scale: 2
    change_column :wires, :amount, :decimal, precision: 10, scale: 2
  end
end
