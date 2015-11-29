class WebhooksController < ApplicationController
  protect_from_forgery :except => :stripe_webhook
  before_filter :authenticate_user!, except: :stripe_webhook

  def stripe_webhook
    event_json = JSON.parse(request.body.read)
    amount_in_dollars = event_json["data"]["object"]["amount"].to_f/100
    email = event_json["data"]["object"]["metadata"]["student_mail"]
    description = event_json["data"]["object"]["description"]
    diglabs0 = event_json["data"]["object"]["metadata"]["diglabs0"]
    diglabs1 = event_json["data"]["object"]["metadata"]["diglabs1"]
    dig_labs = eval(diglabs0 + diglabs1)
    first_name = dig_labs[:fname]
    last_name = dig_labs[:lname]
    notes = dig_labs[:cohort]

    if (amount_in_dollars == 1000.0) && (description == "DigLabs Stripe Plugin Charge")
      @student = Student.new(first_name: first_name, last_name: last_name, email: email, notes: notes)
      @student.save
    end
  end
end
