require 'test_helper'

class GratisSmsloansControllerTest < ActionController::TestCase
  setup do
    @gratis_smsloan = gratis_smsloans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:gratis_smsloans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create gratis_smsloan" do
    assert_difference('GratisSmsloan.count') do
      post :create, gratis_smsloan: { bank: @gratis_smsloan.bank, comment2: @gratis_smsloan.comment2, comment: @gratis_smsloan.comment, link_button: @gratis_smsloan.link_button, loan_time: @gratis_smsloan.loan_time, max_loan_amount: @gratis_smsloan.max_loan_amount, min_loan_amount: @gratis_smsloan.min_loan_amount }
    end

    assert_redirected_to gratis_smsloan_path(assigns(:gratis_smsloan))
  end

  test "should show gratis_smsloan" do
    get :show, id: @gratis_smsloan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @gratis_smsloan
    assert_response :success
  end

  test "should update gratis_smsloan" do
    patch :update, id: @gratis_smsloan, gratis_smsloan: { bank: @gratis_smsloan.bank, comment2: @gratis_smsloan.comment2, comment: @gratis_smsloan.comment, link_button: @gratis_smsloan.link_button, loan_time: @gratis_smsloan.loan_time, max_loan_amount: @gratis_smsloan.max_loan_amount, min_loan_amount: @gratis_smsloan.min_loan_amount }
    assert_redirected_to gratis_smsloan_path(assigns(:gratis_smsloan))
  end

  test "should destroy gratis_smsloan" do
    assert_difference('GratisSmsloan.count', -1) do
      delete :destroy, id: @gratis_smsloan
    end

    assert_redirected_to gratis_smsloans_path
  end
end
