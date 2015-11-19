class ChangeReceivedDateOnWires < ActiveRecord::Migration
  def change
    change_column :wires, :received_date, :date
  end
end
