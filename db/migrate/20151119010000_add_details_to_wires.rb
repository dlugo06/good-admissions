class AddDetailsToWires < ActiveRecord::Migration
  def change
    add_column :wires, :amount, :integer
    add_column :wires, :send_date, :datetime
    add_column :wires, :received_date, :datetime
    add_column :wires, :sender, :string
  end
end
