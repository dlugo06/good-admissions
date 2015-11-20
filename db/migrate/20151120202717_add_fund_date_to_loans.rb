class AddFundDateToLoans < ActiveRecord::Migration
  def change
    add_column :loans, :fund_date, :date
  end
end
