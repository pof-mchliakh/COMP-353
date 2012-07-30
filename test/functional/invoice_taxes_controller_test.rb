require 'test_helper'

class InvoiceTaxesControllerTest < ActionController::TestCase
  setup do
    @invoice_tax = invoice_tax(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:invoice_tax)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create invoice_tax" do
    assert_difference('InvoiceTax.count') do
      post :create, invoice_tax: { invoice_id: @invoice_tax.invoice_id, tax_id: @invoice_tax.tax_id }
    end

    assert_redirected_to invoice_tax_path(assigns(:invoice_tax))
  end

  test "should show invoice_tax" do
    get :show, id: @invoice_tax
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @invoice_tax
    assert_response :success
  end

  test "should update invoice_tax" do
    put :update, id: @invoice_tax, invoice_tax: { invoice_id: @invoice_tax.invoice_id, tax_id: @invoice_tax.tax_id }
    assert_redirected_to invoice_tax_path(assigns(:invoice_tax))
  end

  test "should destroy invoice_tax" do
    assert_difference('InvoiceTax.count', -1) do
      delete :destroy, id: @invoice_tax
    end

    assert_redirected_to invoice_taxes_path
  end
end
