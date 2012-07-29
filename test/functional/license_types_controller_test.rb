require 'test_helper'

class LicenseTypesControllerTest < ActionController::TestCase
  setup do
    @license_type = license_type(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:license_type)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create license_type" do
    assert_difference('LicenseType.count') do
      post :create, license_type: { name: @license_type.name }
    end

    assert_redirected_to license_type_path(assigns(:license_type))
  end

  test "should show license_type" do
    get :show, id: @license_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @license_type
    assert_response :success
  end

  test "should update license_type" do
    put :update, id: @license_type, license_type: { name: @license_type.name }
    assert_redirected_to license_type_path(assigns(:license_type))
  end

  test "should destroy license_type" do
    assert_difference('LicenseType.count', -1) do
      delete :destroy, id: @license_type
    end

    assert_redirected_to license_types_path
  end
end
