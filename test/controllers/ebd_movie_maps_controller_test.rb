require 'test_helper'

class EbdMovieMapsControllerTest < ActionController::TestCase
  setup do
    @ebd_movie_map = ebd_movie_maps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ebd_movie_maps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ebd_movie_map" do
    assert_difference('EbdMovieMap.count') do
      post :create, ebd_movie_map: { description: @ebd_movie_map.description, ebd_id: @ebd_movie_map.ebd_id, movie_id: @ebd_movie_map.movie_id }
    end

    assert_redirected_to ebd_movie_map_path(assigns(:ebd_movie_map))
  end

  test "should show ebd_movie_map" do
    get :show, id: @ebd_movie_map
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ebd_movie_map
    assert_response :success
  end

  test "should update ebd_movie_map" do
    patch :update, id: @ebd_movie_map, ebd_movie_map: { description: @ebd_movie_map.description, ebd_id: @ebd_movie_map.ebd_id, movie_id: @ebd_movie_map.movie_id }
    assert_redirected_to ebd_movie_map_path(assigns(:ebd_movie_map))
  end

  test "should destroy ebd_movie_map" do
    assert_difference('EbdMovieMap.count', -1) do
      delete :destroy, id: @ebd_movie_map
    end

    assert_redirected_to ebd_movie_maps_path
  end
end
