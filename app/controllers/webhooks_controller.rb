class WebhooksController < ApplicationController
  before_filter :authenticate_user!, except: :stripe_webhook
  protect_from_forgery :except => :stripe_webhook

  private
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

    if (amount_in_dollars == 1000.0) && (description == "DigLabs Stripe Plugin Charge")
      puts amount_in_dollars
      puts description
      puts dig_labs
      puts first_name
      puts last_name
      puts email
    end
    redirect_to root_path
  end
end
