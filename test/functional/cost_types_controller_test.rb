require 'test_helper'

class CostTypesControllerTest < ActionController::TestCase
  setup do
    @cost_type = cost_type(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cost_type)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cost_type" do
    assert_difference('CostType.count') do
      post :create, cost_type: { name: @cost_type.name }
    end

    assert_redirected_to cost_type_path(assigns(:cost_type))
  end

  test "should show cost_type" do
    get :show, id: @cost_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cost_type
    assert_response :success
  end

  test "should update cost_type" do
    put :update, id: @cost_type, cost_type: { name: @cost_type.name }
    assert_redirected_to cost_type_path(assigns(:cost_type))
  end

  test "should destroy cost_type" do
    assert_difference('CostType.count', -1) do
      delete :destroy, id: @cost_type
    end

    assert_redirected_to cost_types_path
  end
end
