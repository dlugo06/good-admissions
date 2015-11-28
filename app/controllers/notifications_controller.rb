class NotificationsController < ApplicationController
  skip_before_action :verify_authenticity_token
  include ActionView::Helpers::NumberHelper

  def notify
    client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
    student = Student.find(params[:student_id])
    payment_type = params[:payment_type]
    case payment_type
    when "wire"
      amount = Wire.find(params[:id]).amount
      date = Wire.find(params[:id]).pay_date.strftime("%m/%d/%Y")
    when "stripe"
      amount = Stripe.find(params[:id]).amount
      date = Stripe.find(params[:id]).pay_date.strftime("%m/%d/%Y")
    when "loan"
      amount = Loan.find(params[:id]).amount
      date = Loan.find(params[:id]).pay_date.strftime("%m/%d/%Y")
    when "check"
      amount = Check.find(params[:id]).amount
      date = Check.find(params[:id]).pay_date.strftime("%m/%d/%Y")
    end
    message_content = "Notification from Wyncode Academy. Hello #{student.first_name}! We have received your #{payment_type} payment of #{number_to_currency(amount)} on #{date}. If you have any questions please contact us at weare@wyncode.co"
    # raise
    client.messages.create from: '760-313-7138', to: "#{student.phone_num}", body: message_content
    redirect_to student_payments_path(student), notice: "Text notification successfully sent to #{student.full_name}"
  end
end
