class ChangeDepositedDateOnChecks < ActiveRecord::Migration
  def change
    change_column :checks, :deposited_date, :date
  end
end
