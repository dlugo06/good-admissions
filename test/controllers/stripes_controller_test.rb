require 'test_helper'

class StripesControllerTest < ActionController::TestCase
  setup do
    @stripe = stripes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:stripes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create stripe" do
    assert_difference('Stripe.count') do
      post :create, stripe: { student_id: @stripe.student_id }
    end

    assert_redirected_to stripe_path(assigns(:stripe))
  end

  test "should show stripe" do
    get :show, id: @stripe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @stripe
    assert_response :success
  end

  test "should update stripe" do
    patch :update, id: @stripe, stripe: { student_id: @stripe.student_id }
    assert_redirected_to stripe_path(assigns(:stripe))
  end

  test "should destroy stripe" do
    assert_difference('Stripe.count', -1) do
      delete :destroy, id: @stripe
    end

    assert_redirected_to stripes_path
  end
end
