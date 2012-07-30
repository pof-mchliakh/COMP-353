require 'test_helper'

class TruckTypesControllerTest < ActionController::TestCase
  setup do
    @truck_type = truck_type(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:truck_type)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create truck_type" do
    assert_difference('TruckType.count') do
      post :create, truck_type: { name: @truck_type.name }
    end

    assert_redirected_to truck_type_path(assigns(:truck_type))
  end

  test "should show truck_type" do
    get :show, id: @truck_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @truck_type
    assert_response :success
  end

  test "should update truck_type" do
    put :update, id: @truck_type, truck_type: { name: @truck_type.name }
    assert_redirected_to truck_type_path(assigns(:truck_type))
  end

  test "should destroy truck_type" do
    assert_difference('TruckType.count', -1) do
      delete :destroy, id: @truck_type
    end

    assert_redirected_to truck_types_path
  end
end
