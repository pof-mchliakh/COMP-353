require 'test_helper'

class DriverLicenseTypesControllerTest < ActionController::TestCase
  setup do
    @driver_license_type = driver_license_type(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:driver_license_type)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create driver_license_type" do
    assert_difference('DriverLicenseType.count') do
      post :create, driver_license_type: { driver_id: @driver_license_type.driver_id, license_type_id: @driver_license_type.license_type_id }
    end

    assert_redirected_to driver_license_type_path(assigns(:driver_license_type))
  end

  test "should show driver_license_type" do
    get :show, id: @driver_license_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @driver_license_type
    assert_response :success
  end

  test "should update driver_license_type" do
    put :update, id: @driver_license_type, driver_license_type: { driver_id: @driver_license_type.driver_id, license_type_id: @driver_license_type.license_type_id }
    assert_redirected_to driver_license_type_path(assigns(:driver_license_type))
  end

  test "should destroy driver_license_type" do
    assert_difference('DriverLicenseType.count', -1) do
      delete :destroy, id: @driver_license_type
    end

    assert_redirected_to driver_license_types_path
  end
end
