require 'test_helper'

class CostsControllerTest < ActionController::TestCase
  setup do
    @cost = cost(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:cost)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create cost" do
    assert_difference('Cost.count') do
      post :create, cost: { amt: @cost.amt, cost_type_id: @cost.cost_type_id, truck_type_id: @cost.truck_type_id }
    end

    assert_redirected_to cost_path(assigns(:cost))
  end

  test "should show cost" do
    get :show, id: @cost
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @cost
    assert_response :success
  end

  test "should update cost" do
    put :update, id: @cost, cost: { amt: @cost.amt, cost_type_id: @cost.cost_type_id, truck_type_id: @cost.truck_type_id }
    assert_redirected_to cost_path(assigns(:cost))
  end

  test "should destroy cost" do
    assert_difference('Cost.count', -1) do
      delete :destroy, id: @cost
    end

    assert_redirected_to costs_path
  end
end
