require 'test_helper'

class MissionsControllerTest < ActionController::TestCase
  setup do
    @mission = mission(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mission)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mission" do
    assert_difference('Mission.count') do
      post :create, mission: { driver_id: @mission.driver_id, expected_end_time: @mission.expected_end_time, expected_start_time: @mission.expected_start_time, invoice_id: @mission.invoice_id, truck_id: @mission.truck_id }
    end

    assert_redirected_to mission_path(assigns(:mission))
  end

  test "should show mission" do
    get :show, id: @mission
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mission
    assert_response :success
  end

  test "should update mission" do
    put :update, id: @mission, mission: { driver_id: @mission.driver_id, expected_end_time: @mission.expected_end_time, expected_start_time: @mission.expected_start_time, invoice_id: @mission.invoice_id, truck_id: @mission.truck_id }
    assert_redirected_to mission_path(assigns(:mission))
  end

  test "should destroy mission" do
    assert_difference('Mission.count', -1) do
      delete :destroy, id: @mission
    end

    assert_redirected_to missions_path
  end
end
