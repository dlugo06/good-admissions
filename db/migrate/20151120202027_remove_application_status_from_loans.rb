class RemoveApplicationStatusFromLoans < ActiveRecord::Migration
  def change
    remove_column :loans, :application_status, :string
  end
end
