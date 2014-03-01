require 'test_helper'

class LineDebtsControllerTest < ActionController::TestCase
  setup do
    @line_debt = line_debts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:line_debts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create line_debt" do
    assert_difference('LineDebt.count') do
      post :create, line_debt: { cart_id: @line_debt.cart_id, debt_id: @line_debt.debt_id }
    end

    assert_redirected_to line_debt_path(assigns(:line_debt))
  end

  test "should show line_debt" do
    get :show, id: @line_debt
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @line_debt
    assert_response :success
  end

  test "should update line_debt" do
    patch :update, id: @line_debt, line_debt: { cart_id: @line_debt.cart_id, debt_id: @line_debt.debt_id }
    assert_redirected_to line_debt_path(assigns(:line_debt))
  end

  test "should destroy line_debt" do
    assert_difference('LineDebt.count', -1) do
      delete :destroy, id: @line_debt
    end

    assert_redirected_to line_debts_path
  end
end
