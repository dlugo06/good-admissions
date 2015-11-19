class ChangeReceivedDateOnChecks < ActiveRecord::Migration
  def change
    change_column :checks, :received_date, :date
  end
end
