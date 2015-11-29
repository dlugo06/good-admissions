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
    dig_labs = diglabs0 + diglabs1
    dig_labs.chop!
    dig_labs.slice!(0)
    dig_labs = dig_labs.split(',')
    first_name = ""
    last_name = ""
    notes = ""

    dig_labs.each do |string|
      if string.include?('fname')
        string = string.partition(":").last
        string.slice!(0)
        first_name = string.chop!
      elsif string.include?('lname')
        string = string.partition(":").last
        string.slice!(0)
        last_name = string.chop!
      elsif string.include?('cohort')
        string = string.partition(":").last
        string.slice!(0)
        notes = string.chop!
      end
    end

    if (amount_in_dollars == 1000.0) && (description == "DigLabs Stripe Plugin Charge")
      @student = Student.new(first_name: first_name, last_name: last_name, email: email, notes: notes)
      @student.save
    end
  end
end
