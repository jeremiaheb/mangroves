require 'test_helper'

class ReferenceSitesControllerTest < ActionController::TestCase
  setup do
    @reference_site = reference_sites(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reference_sites)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reference_site" do
    assert_difference('ReferenceSite.count') do
      post :create, reference_site: @reference_site.attributes
    end

    assert_redirected_to reference_site_path(assigns(:reference_site))
  end

  test "should show reference_site" do
    get :show, id: @reference_site
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reference_site
    assert_response :success
  end

  test "should update reference_site" do
    put :update, id: @reference_site, reference_site: @reference_site.attributes
    assert_redirected_to reference_site_path(assigns(:reference_site))
  end

  test "should destroy reference_site" do
    assert_difference('ReferenceSite.count', -1) do
      delete :destroy, id: @reference_site
    end

    assert_redirected_to reference_sites_path
  end
end
