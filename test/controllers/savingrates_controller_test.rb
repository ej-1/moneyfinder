require 'test_helper'

class SavingratesControllerTest < ActionController::TestCase
  setup do
    @savingrate = savingrates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:savingrates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create savingrate" do
    assert_difference('Savingrate.count') do
      post :create, savingrate: { account_time_length: @savingrate.account_time_length, amount_limit: @savingrate.amount_limit, bank: @savingrate.bank, conditions: @savingrate.conditions, country: @savingrate.country, currency: @savingrate.currency, deposit_guarantee: @savingrate.deposit_guarantee, max_rate: @savingrate.max_rate, min_rate: @savingrate.min_rate, withdrawal: @savingrate.withdrawal }
    end

    assert_redirected_to savingrate_path(assigns(:savingrate))
  end

  test "should show savingrate" do
    get :show, id: @savingrate
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @savingrate
    assert_response :success
  end

  test "should update savingrate" do
    patch :update, id: @savingrate, savingrate: { account_time_length: @savingrate.account_time_length, amount_limit: @savingrate.amount_limit, bank: @savingrate.bank, conditions: @savingrate.conditions, country: @savingrate.country, currency: @savingrate.currency, deposit_guarantee: @savingrate.deposit_guarantee, max_rate: @savingrate.max_rate, min_rate: @savingrate.min_rate, withdrawal: @savingrate.withdrawal }
    assert_redirected_to savingrate_path(assigns(:savingrate))
  end

  test "should destroy savingrate" do
    assert_difference('Savingrate.count', -1) do
      delete :destroy, id: @savingrate
    end

    assert_redirected_to savingrates_path
  end
end
