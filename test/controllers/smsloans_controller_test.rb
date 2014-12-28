require 'test_helper'

class SmsloansControllerTest < ActionController::TestCase
  setup do
    @smsloan = smsloans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:smsloans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create smsloan" do
    assert_difference('Smsloan.count') do
      post :create, smsloan: { bank: @smsloan.bank, bankid: @smsloan.bankid, cost_free_loan: @smsloan.cost_free_loan, max_loanamoun: @smsloan.max_loanamoun, min_loanamoun: @smsloan.min_loanamoun, mobile_friendly_site: @smsloan.mobile_friendly_site, new_borrower_10K: @smsloan.new_borrower_10K, new_borrower_5K: @smsloan.new_borrower_5K, no_uc: @smsloan.no_uc, open_on_saturdays: @smsloan.open_on_saturdays, skef_member: @smsloan.skef_member, smsloan_min_age: @smsloan.smsloan_min_age, smsloan_payment_note: @smsloan.smsloan_payment_note, weblink: @smsloan.weblink }
    end

    assert_redirected_to smsloan_path(assigns(:smsloan))
  end

  test "should show smsloan" do
    get :show, id: @smsloan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @smsloan
    assert_response :success
  end

  test "should update smsloan" do
    patch :update, id: @smsloan, smsloan: { bank: @smsloan.bank, bankid: @smsloan.bankid, cost_free_loan: @smsloan.cost_free_loan, max_loanamoun: @smsloan.max_loanamoun, min_loanamoun: @smsloan.min_loanamoun, mobile_friendly_site: @smsloan.mobile_friendly_site, new_borrower_10K: @smsloan.new_borrower_10K, new_borrower_5K: @smsloan.new_borrower_5K, no_uc: @smsloan.no_uc, open_on_saturdays: @smsloan.open_on_saturdays, skef_member: @smsloan.skef_member, smsloan_min_age: @smsloan.smsloan_min_age, smsloan_payment_note: @smsloan.smsloan_payment_note, weblink: @smsloan.weblink }
    assert_redirected_to smsloan_path(assigns(:smsloan))
  end

  test "should destroy smsloan" do
    assert_difference('Smsloan.count', -1) do
      delete :destroy, id: @smsloan
    end

    assert_redirected_to smsloans_path
  end
end
