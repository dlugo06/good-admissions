class Loan < ActiveRecord::Base
  belongs_to :student
  validates :pay_date, :amount, :company, presence: true
end
