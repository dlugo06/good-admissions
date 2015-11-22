class PaymentsController < ApplicationController
  def new
    @student = Student.find(params[:id])
    @loan = Loan.new
    @check = Check.new
    @wire = Wire.new
    @stripe = Stripe.new
  end
end
