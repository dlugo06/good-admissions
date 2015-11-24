class AddBalanceToStudent < ActiveRecord::Migration
  def change
    add_column :students, :balance, :decimal, default: 10000
  end
end
