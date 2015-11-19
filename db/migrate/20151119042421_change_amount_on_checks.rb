class ChangeAmountOnChecks < ActiveRecord::Migration
  def change
    change_column :checks, :amount, :decimal, precision: 10, scale: 2
  end
end
