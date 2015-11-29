require 'twilio-ruby'

class TwilioController < ApplicationController
  include Webhookable

  after_filter :set_header
  skip_before_action :verify_authenticity_token

  def voice
  	response = Twilio::TwiML::Response.new do |r|
  	  r.Say "Thank you for calling win code's Twilio number. If you would like to get in touch you can email us at we are at win code dot co or call us at 305 702 2422.", :voice => 'alice'
  	end

  	render_twiml response
  end
end
