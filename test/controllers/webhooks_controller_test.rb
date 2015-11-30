require 'test_helper'

class WebhooksControllerTest < ActionController::TestCase
  test "should get stripe_webhook" do
    get :stripe_webhook
    assert_response :success
  end

end
