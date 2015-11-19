class AddDetailsToLoans < ActiveRecord::Migration
  def change
    add_column :loans, :application_status, :string
    add_column :loans, :notes, :text
    add_column :loans, :amount, :integer
  end
end
