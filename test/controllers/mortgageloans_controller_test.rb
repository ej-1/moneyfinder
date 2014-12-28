require 'test_helper'

class MortgageloansControllerTest < ActionController::TestCase
  setup do
    @mortgageloan = mortgageloans(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:mortgageloans)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create mortgageloan" do
    assert_difference('Mortgageloan.count') do
      post :create, mortgageloan: { bank: @mortgageloan.bank, fixation_rate_10years: @mortgageloan.fixation_rate_10years, fixation_rate_1years: @mortgageloan.fixation_rate_1years, fixation_rate_2years: @mortgageloan.fixation_rate_2years, fixation_rate_3months: @mortgageloan.fixation_rate_3months, fixation_rate_3years: @mortgageloan.fixation_rate_3years, fixation_rate_5years: @mortgageloan.fixation_rate_5years, fixation_rate_7years: @mortgageloan.fixation_rate_7years, weblink: @mortgageloan.weblink }
    end

    assert_redirected_to mortgageloan_path(assigns(:mortgageloan))
  end

  test "should show mortgageloan" do
    get :show, id: @mortgageloan
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @mortgageloan
    assert_response :success
  end

  test "should update mortgageloan" do
    patch :update, id: @mortgageloan, mortgageloan: { bank: @mortgageloan.bank, fixation_rate_10years: @mortgageloan.fixation_rate_10years, fixation_rate_1years: @mortgageloan.fixation_rate_1years, fixation_rate_2years: @mortgageloan.fixation_rate_2years, fixation_rate_3months: @mortgageloan.fixation_rate_3months, fixation_rate_3years: @mortgageloan.fixation_rate_3years, fixation_rate_5years: @mortgageloan.fixation_rate_5years, fixation_rate_7years: @mortgageloan.fixation_rate_7years, weblink: @mortgageloan.weblink }
    assert_redirected_to mortgageloan_path(assigns(:mortgageloan))
  end

  test "should destroy mortgageloan" do
    assert_difference('Mortgageloan.count', -1) do
      delete :destroy, id: @mortgageloan
    end

    assert_redirected_to mortgageloans_path
  end
end
