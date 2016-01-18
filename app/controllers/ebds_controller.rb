class EbdsController < ApplicationController
  before_action :set_ebd, only: [:show, :edit, :update, :destroy]

  # GET /ebds
  # GET /ebds.json
  def index
    @ebds = Ebd.all
  end

  # GET /ebds/1
  # GET /ebds/1.json
  def show
    @movies = Movie.joins(:ebdMovieMaps).where("ebd_movie_maps.ebd_id = ?", params[:id])
  end

  # GET /ebds/new
  def new
    @ebd = Ebd.new
  end

  # GET /ebds/1/edit
  def edit
  end

  # POST /ebds
  # POST /ebds.json
  def create
    @ebd = Ebd.new(ebd_params)

    respond_to do |format|
      if @ebd.save
        format.html { redirect_to @ebd, notice: 'Ebd was successfully created.' }
        format.json { render :show, status: :created, location: @ebd }
      else
        format.html { render :new }
        format.json { render json: @ebd.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ebds/1
  # PATCH/PUT /ebds/1.json
  def update
    respond_to do |format|
      if @ebd.update(ebd_params)
        format.html { redirect_to @ebd, notice: 'Ebd was successfully updated.' }
        format.json { render :show, status: :ok, location: @ebd }
      else
        format.html { render :edit }
        format.json { render json: @ebd.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ebds/1
  # DELETE /ebds/1.json
  def destroy
    @ebd.destroy
    respond_to do |format|
      format.html { redirect_to ebds_url, notice: 'Ebd was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ebd
      @ebd = Ebd.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ebd_params
      params.require(:ebd).permit(:name, :description, :wikipedia_url)
    end
end
