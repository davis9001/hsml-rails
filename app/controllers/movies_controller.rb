require 'omdb'

class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]

  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.all
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
    @ebds = Ebd.joins(:ebdMovieMaps).where("ebd_movie_maps.movie_id = ?", params[:id])
  end

  # GET /movies/show-from-imdb-id
  # GET /movies/show-from-imdb-id.json
  def show_from_imdb_id
    @omdb_movie = Omdb::Api.new.find(params[:imdb_id])[:movie]
    @movie_exists = false
    if existing_movie = Movie.find_by(imdb_id: params[:imdb_id])
      @movie_exists = true
      @existing_movie_id = existing_movie.id
    end
  end

  # GET /movies/show-from-title
  # GET /movies/show-from-title.json
  def show_from_title
    @omdb_movies = Omdb::Api.new.search(params[:title])
    if @omdb_movies[:status] != 200
      redirect_to '/movies', alert: 'No results for that title on IMDB'
    end
  end

  # GET /movies/new
  def new
    @movie = Movie.new
  end

  # GET /movies/1/edit
  def edit
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # POST /movies/create-from-imdbid
  # POST /movies/create-from-imdbid.json
  def create_from_imdb_id
    omdb_movie = Omdb::Api.new.find(params[:imdb_id])[:movie]

    @movie = Movie.new(name: omdb_movie.title, plot: omdb_movie.plot, rating_votes: omdb_movie.imdb_votes, rating: omdb_movie.imdb_rating, year_released: omdb_movie.year, thumbnails: omdb_movie.poster, imdb_id: omdb_movie.imdb_id, runtime: omdb_movie.runtime, mpaa_rating: omdb_movie.rated, genre: omdb_movie.genre, director: omdb_movie.director)
      # :loaded, :title, :year, :rated, :released, :runtime, :genre, :director, :writer, :actors, :plot,
      # :poster, :imdb_rating, :imdb_votes, :imdb_id, :type, :metascore, :language, :country, :awards
    
    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # GET /movies/1/add-ebd
  def add_ebd
    if (params[:ebd_id])
      Ebd_movie_maps.new(ebd_id: params[:ebd_id], movie_id: params[:id])
    end
    @ebds = Ebd.all
    set_movie()
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:name, :plot, :plot_outline, :tagline, :rating_votes, :rating, :writers, :year_released, :thumbnails, :imdb_id, :sortable_formatted_title, :runtime, :mpaa_rating, :genre, :director, :original_title, :studio, :trailer_url, :country)
    end
end
