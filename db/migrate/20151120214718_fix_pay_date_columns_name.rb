class FixPayDateColumnsName < ActiveRecord::Migration
  def change
    rename_column :checks, :received_date, :pay_date
    rename_column :loans, :fund_date, :pay_date
    rename_column :wires, :received_date, :pay_date
  end
end
