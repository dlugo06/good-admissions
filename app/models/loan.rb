class Loan < ActiveRecord::Base
  belongs_to :student
  validates :pay_date, :amount, :company, presence: true

  def calculated_difference(params)
    self.amount - params["amount"].to_i
  end
end
