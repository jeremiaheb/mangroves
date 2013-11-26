require 'test_helper'

class BottomTypesControllerTest < ActionController::TestCase
  setup do
    @bottom_type = bottom_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bottom_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bottom_type" do
    assert_difference('BottomType.count') do
      post :create, bottom_type: @bottom_type.attributes
    end

    assert_redirected_to bottom_type_path(assigns(:bottom_type))
  end

  test "should show bottom_type" do
    get :show, id: @bottom_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bottom_type
    assert_response :success
  end

  test "should update bottom_type" do
    put :update, id: @bottom_type, bottom_type: @bottom_type.attributes
    assert_redirected_to bottom_type_path(assigns(:bottom_type))
  end

  test "should destroy bottom_type" do
    assert_difference('BottomType.count', -1) do
      delete :destroy, id: @bottom_type
    end

    assert_redirected_to bottom_types_path
  end
end
