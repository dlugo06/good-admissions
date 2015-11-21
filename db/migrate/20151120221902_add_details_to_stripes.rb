class AddDetailsToStripes < ActiveRecord::Migration
  def change
    add_column :stripes, :amount, :decimal, precision: 10, scale: 2
    add_column :stripes, :refunded, :boolean, default: false
    add_column :stripes, :pay_date, :date
  end
end
