require 'test_helper'

class MoviesControllerTest < ActionController::TestCase
  setup do
    @movie = movies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:movies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create movie" do
    assert_difference('Movie.count') do
      post :create, movie: { country: @movie.country, director: @movie.director, genre: @movie.genre, imdb_id: @movie.imdb_id, mpaa_rating: @movie.mpaa_rating, name: @movie.name, original_title: @movie.original_title, plot: @movie.plot, plot_outline: @movie.plot_outline, rating: @movie.rating, rating_votes: @movie.rating_votes, runtime: @movie.runtime, sortable_formatted_title: @movie.sortable_formatted_title, studio: @movie.studio, tagline: @movie.tagline, thumbnails: @movie.thumbnails, trailer_url: @movie.trailer_url, writers: @movie.writers, year_released: @movie.year_released }
    end

    assert_redirected_to movie_path(assigns(:movie))
  end

  test "should show movie" do
    get :show, id: @movie
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @movie
    assert_response :success
  end

  test "should update movie" do
    patch :update, id: @movie, movie: { country: @movie.country, director: @movie.director, genre: @movie.genre, imdb_id: @movie.imdb_id, mpaa_rating: @movie.mpaa_rating, name: @movie.name, original_title: @movie.original_title, plot: @movie.plot, plot_outline: @movie.plot_outline, rating: @movie.rating, rating_votes: @movie.rating_votes, runtime: @movie.runtime, sortable_formatted_title: @movie.sortable_formatted_title, studio: @movie.studio, tagline: @movie.tagline, thumbnails: @movie.thumbnails, trailer_url: @movie.trailer_url, writers: @movie.writers, year_released: @movie.year_released }
    assert_redirected_to movie_path(assigns(:movie))
  end

  test "should destroy movie" do
    assert_difference('Movie.count', -1) do
      delete :destroy, id: @movie
    end

    assert_redirected_to movies_path
  end
end
