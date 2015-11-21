class PaymentsController < ApplicationController
  def new
    @loan = Loan.new
    @check = Check.new
    @wire = Wire.new
    @stripe = Stripe.new
  end
end
