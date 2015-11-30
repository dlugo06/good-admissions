class PaymentsController < ApplicationController
  before_action :check_admin

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
  private
  def check_admin
    if current_user.try(:admin?) == false
      redirect_to root_path, notice: "You are not authorized to take that action"
    end
  end
end
