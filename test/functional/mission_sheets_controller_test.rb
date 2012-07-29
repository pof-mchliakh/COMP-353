require 'test_helper'

class MissionSheetsControllerTest < ActionController::TestCase
  setup do
    @mission_sheet = mission_sheet(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mission_sheet)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mission_sheet" do
    assert_difference('MissionSheet.count') do
      post :create, mission_sheet: { actual_end_time: @mission_sheet.actual_end_time, actual_start_time: @mission_sheet.actual_start_time, end_odometer: @mission_sheet.end_odometer, mission_id: @mission_sheet.mission_id, start_odometer: @mission_sheet.start_odometer }
    end

    assert_redirected_to mission_sheet_path(assigns(:mission_sheet))
  end

  test "should show mission_sheet" do
    get :show, id: @mission_sheet
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mission_sheet
    assert_response :success
  end

  test "should update mission_sheet" do
    put :update, id: @mission_sheet, mission_sheet: { actual_end_time: @mission_sheet.actual_end_time, actual_start_time: @mission_sheet.actual_start_time, end_odometer: @mission_sheet.end_odometer, mission_id: @mission_sheet.mission_id, start_odometer: @mission_sheet.start_odometer }
    assert_redirected_to mission_sheet_path(assigns(:mission_sheet))
  end

  test "should destroy mission_sheet" do
    assert_difference('MissionSheet.count', -1) do
      delete :destroy, id: @mission_sheet
    end

    assert_redirected_to mission_sheets_path
  end
end
