require 'test_helper'

class ReservationsControllerTest < ActionController::TestCase
  setup do
    @reservation = reservation(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reservation)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reservation" do
    assert_difference('Reservation.count') do
      post :create, reservation: { address_id: @reservation.address_id, appointment_date: @reservation.appointment_date, apt: @reservation.apt, client_id: @reservation.client_id, expected_end_time: @reservation.expected_end_time, mission_id: @reservation.mission_id, street_number: @reservation.street_number }
    end

    assert_redirected_to reservation_path(assigns(:reservation))
  end

  test "should show reservation" do
    get :show, id: @reservation
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reservation
    assert_response :success
  end

  test "should update reservation" do
    put :update, id: @reservation, reservation: { address_id: @reservation.address_id, appointment_date: @reservation.appointment_date, apt: @reservation.apt, client_id: @reservation.client_id, expected_end_time: @reservation.expected_end_time, mission_id: @reservation.mission_id, street_number: @reservation.street_number }
    assert_redirected_to reservation_path(assigns(:reservation))
  end

  test "should destroy reservation" do
    assert_difference('Reservation.count', -1) do
      delete :destroy, id: @reservation
    end

    assert_redirected_to reservations_path
  end
end
