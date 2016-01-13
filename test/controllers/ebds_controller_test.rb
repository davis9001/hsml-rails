require 'test_helper'

class EbdsControllerTest < ActionController::TestCase
  setup do
    @ebd = ebds(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ebds)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ebd" do
    assert_difference('Ebd.count') do
      post :create, ebd: { description: @ebd.description, name: @ebd.name, wikipedia_url: @ebd.wikipedia_url }
    end

    assert_redirected_to ebd_path(assigns(:ebd))
  end

  test "should show ebd" do
    get :show, id: @ebd
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ebd
    assert_response :success
  end

  test "should update ebd" do
    patch :update, id: @ebd, ebd: { description: @ebd.description, name: @ebd.name, wikipedia_url: @ebd.wikipedia_url }
    assert_redirected_to ebd_path(assigns(:ebd))
  end

  test "should destroy ebd" do
    assert_difference('Ebd.count', -1) do
      delete :destroy, id: @ebd
    end

    assert_redirected_to ebds_path
  end
end
