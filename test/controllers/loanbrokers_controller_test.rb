require 'test_helper'

class LoanbrokersControllerTest < ActionController::TestCase
  setup do
    @loanbroker = loanbrokers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:loanbrokers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create loanbroker" do
    assert_difference('Loanbroker.count') do
      post :create, loanbroker: { FI_reg: @loanbroker.FI_reg, broker: @loanbroker.broker, broker_logo: @loanbroker.broker_logo, comments2: @loanbroker.comments2, comments: @loanbroker.comments, effective_interest: @loanbroker.effective_interest, invoice_fee: @loanbroker.invoice_fee, max_amount: @loanbroker.max_amount, maxloan_time: @loanbroker.maxloan_time, min_age: @loanbroker.min_age, min_amount: @loanbroker.min_amount, minloan_time: @loanbroker.minloan_time, payment_note: @loanbroker.payment_note, start_fee: @loanbroker.start_fee, web_link: @loanbroker.web_link, yearly_income: @loanbroker.yearly_income }
    end

    assert_redirected_to loanbroker_path(assigns(:loanbroker))
  end

  test "should show loanbroker" do
    get :show, id: @loanbroker
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @loanbroker
    assert_response :success
  end

  test "should update loanbroker" do
    patch :update, id: @loanbroker, loanbroker: { FI_reg: @loanbroker.FI_reg, broker: @loanbroker.broker, broker_logo: @loanbroker.broker_logo, comments2: @loanbroker.comments2, comments: @loanbroker.comments, effective_interest: @loanbroker.effective_interest, invoice_fee: @loanbroker.invoice_fee, max_amount: @loanbroker.max_amount, maxloan_time: @loanbroker.maxloan_time, min_age: @loanbroker.min_age, min_amount: @loanbroker.min_amount, minloan_time: @loanbroker.minloan_time, payment_note: @loanbroker.payment_note, start_fee: @loanbroker.start_fee, web_link: @loanbroker.web_link, yearly_income: @loanbroker.yearly_income }
    assert_redirected_to loanbroker_path(assigns(:loanbroker))
  end

  test "should destroy loanbroker" do
    assert_difference('Loanbroker.count', -1) do
      delete :destroy, id: @loanbroker
    end

    assert_redirected_to loanbrokers_path
  end
end
