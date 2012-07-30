require 'test_helper'

class PeopleControllerTest < ActionController::TestCase
  setup do
    @person = person(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:person)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create person" do
    assert_difference('Person.count') do
      post :create, person: { address_id: @person.address_id, apt: @person.apt, first_name: @person.first_name, last_name: @person.last_name, street_number: @person.street_number, telephone: @person.telephone }
    end

    assert_redirected_to person_path(assigns(:person))
  end

  test "should show person" do
    get :show, id: @person
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @person
    assert_response :success
  end

  test "should update person" do
    put :update, id: @person, person: { address_id: @person.address_id, apt: @person.apt, first_name: @person.first_name, last_name: @person.last_name, street_number: @person.street_number, telephone: @person.telephone }
    assert_redirected_to person_path(assigns(:person))
  end

  test "should destroy person" do
    assert_difference('Person.count', -1) do
      delete :destroy, id: @person
    end

    assert_redirected_to people_path
  end
end
