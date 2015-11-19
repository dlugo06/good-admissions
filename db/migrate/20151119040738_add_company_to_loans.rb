class AddCompanyToLoans < ActiveRecord::Migration
  def change
    add_column :loans, :company, :string
    add_index :loans, :company
  end
end
