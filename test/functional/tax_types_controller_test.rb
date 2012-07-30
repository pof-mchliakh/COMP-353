require 'test_helper'

class TaxTypesControllerTest < ActionController::TestCase
  setup do
    @tax_type = tax_type(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tax_type)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tax_type" do
    assert_difference('TaxType.count') do
      post :create, tax_type: { name: @tax_type.name }
    end

    assert_redirected_to tax_type_path(assigns(:tax_type))
  end

  test "should show tax_type" do
    get :show, id: @tax_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tax_type
    assert_response :success
  end

  test "should update tax_type" do
    put :update, id: @tax_type, tax_type: { name: @tax_type.name }
    assert_redirected_to tax_type_path(assigns(:tax_type))
  end

  test "should destroy tax_type" do
    assert_difference('TaxType.count', -1) do
      delete :destroy, id: @tax_type
    end

    assert_redirected_to tax_types_path
  end
end
