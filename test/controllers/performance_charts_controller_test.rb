require 'test_helper'

class PerformanceChartsControllerTest < ActionController::TestCase
  setup do
    @performance_chart = performance_charts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:performance_charts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create performance_chart" do
    assert_difference('PerformanceChart.count') do
      post :create, performance_chart: {  }
    end

    assert_redirected_to performance_chart_path(assigns(:performance_chart))
  end

  test "should show performance_chart" do
    get :show, id: @performance_chart
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @performance_chart
    assert_response :success
  end

  test "should update performance_chart" do
    patch :update, id: @performance_chart, performance_chart: {  }
    assert_redirected_to performance_chart_path(assigns(:performance_chart))
  end

  test "should destroy performance_chart" do
    assert_difference('PerformanceChart.count', -1) do
      delete :destroy, id: @performance_chart
    end

    assert_redirected_to performance_charts_path
  end
end
