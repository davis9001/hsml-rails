class EbdMovieMapsController < ApplicationController
  before_action :set_ebd_movie_map, only: [:show, :edit, :update, :destroy]

  # GET /ebd_movie_maps
  # GET /ebd_movie_maps.json
  def index
    @ebd_movie_maps = EbdMovieMap.all
  end

  # GET /ebd_movie_maps/1
  # GET /ebd_movie_maps/1.json
  def show
  end

  # GET /ebd_movie_maps/new
  def new
    @ebd_movie_map = EbdMovieMap.new
  end

  # GET /ebd_movie_maps/1/edit
  def edit
  end

  # POST /ebd_movie_maps
  # POST /ebd_movie_maps.json
  def create
    @ebd_movie_map = EbdMovieMap.new(ebd_movie_map_params)

    respond_to do |format|
      if @ebd_movie_map.save
        format.html { redirect_to @ebd_movie_map, notice: 'Ebd movie map was successfully created.' }
        format.json { render :show, status: :created, location: @ebd_movie_map }
      else
        format.html { render :new }
        format.json { render json: @ebd_movie_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ebd_movie_maps/1
  # PATCH/PUT /ebd_movie_maps/1.json
  def update
    respond_to do |format|
      if @ebd_movie_map.update(ebd_movie_map_params)
        format.html { redirect_to @ebd_movie_map, notice: 'Ebd movie map was successfully updated.' }
        format.json { render :show, status: :ok, location: @ebd_movie_map }
      else
        format.html { render :edit }
        format.json { render json: @ebd_movie_map.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ebd_movie_maps/1
  # DELETE /ebd_movie_maps/1.json
  def destroy
    @ebd_movie_map.destroy
    respond_to do |format|
      format.html { redirect_to ebd_movie_maps_url, notice: 'Ebd movie map was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ebd_movie_map
      @ebd_movie_map = EbdMovieMap.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ebd_movie_map_params
      params.require(:ebd_movie_map).permit(:description, :ebd_id, :movie_id)
    end
end
