class ChangeSendDateOnWires < ActiveRecord::Migration
  def change
    change_column :wires, :send_date, :date
  end
end
