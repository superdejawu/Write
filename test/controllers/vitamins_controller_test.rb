require 'test_helper'

class VitaminsControllerTest < ActionController::TestCase
  setup do
    @vitamin = vitamins(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vitamins)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vitamin" do
    assert_difference('Vitamin.count') do
      post :create, vitamin: { description: @vitamin.description }
    end

    assert_redirected_to vitamin_path(assigns(:vitamin))
  end

  test "should show vitamin" do
    get :show, id: @vitamin
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vitamin
    assert_response :success
  end

  test "should update vitamin" do
    patch :update, id: @vitamin, vitamin: { description: @vitamin.description }
    assert_redirected_to vitamin_path(assigns(:vitamin))
  end

  test "should destroy vitamin" do
    assert_difference('Vitamin.count', -1) do
      delete :destroy, id: @vitamin
    end

    assert_redirected_to vitamins_path
  end
end
