require 'test_helper'

class WiresControllerTest < ActionController::TestCase
  setup do
    @wire = wires(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:wires)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create wire" do
    assert_difference('Wire.count') do
      post :create, wire: { student_id: @wire.student_id }
    end

    assert_redirected_to wire_path(assigns(:wire))
  end

  test "should show wire" do
    get :show, id: @wire
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @wire
    assert_response :success
  end

  test "should update wire" do
    patch :update, id: @wire, wire: { student_id: @wire.student_id }
    assert_redirected_to wire_path(assigns(:wire))
  end

  test "should destroy wire" do
    assert_difference('Wire.count', -1) do
      delete :destroy, id: @wire
    end

    assert_redirected_to wires_path
  end
end
