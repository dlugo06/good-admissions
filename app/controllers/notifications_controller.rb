class NotificationsController < ApplicationController

  skip_before_action :verify_authenticity_token

  def notify
    client = Twilio::REST::Client.new Rails.application.secrets.twilio_account_sid, Rails.application.secrets.twilio_auth_token
    message_content = 'Learning to send SMS you are.'
    message = client.messages.create from: '760-313-7138', to: '6195722049', body: message_content
    render plain: message.status
  end

end
