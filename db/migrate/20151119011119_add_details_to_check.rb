class AddDetailsToCheck < ActiveRecord::Migration
  def change
    add_column :checks, :received_date, :datetime
    add_column :checks, :deposited_date, :datetime
    add_column :checks, :amount, :integer
    add_column :checks, :name_on_check, :string
    add_column :checks, :check_number, :integer
  end
end
