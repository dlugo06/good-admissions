class PaymentsController < ApplicationController
  def new
    @student = Student.find(params[:id])
    @loan = Loan.new
    @check = Check.new
    @wire = Wire.new
    @stripe = Stripe.new
  end

  def index
    @payments = Student.all.map{ |s| s.payments }.flatten.sort_by(&:pay_date).reverse!
  end
end
