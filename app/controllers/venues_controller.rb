class VenuesController < ApplicationController
  before_action :set_venue, only: [:show, :edit, :update, :destroy]

  # GET /venues
  # GET /venues.json
  def index
    #@venues = Venue.all
    if params[:per]== "all"
      params[:per] = Venue.all.count
    end
    @venues = Venue.nearby_places(params[:search]).page(params[:page]).per(params[:per])
    
    @hash = Gmaps4rails.build_markers(@venues) do |venues, marker|
      marker.lat venues.latitude
      marker.lng venues.longitude
    end
    # @searchlocation = params[:search]
    # @search_place = search_text
    @search_presentation_string = search_text

    respond_to do |format|
      if (@venues.length == 0)
      format.html {redirect_to venues_path, notice: 'No places match your query'}
      end
      format.html
      format.json {render :json => @venues}
    end 
  end

  def find

  end

  # GET /venues/1
  # GET /venues/1.json
  def show
  end

  # GET /venues/new
  def new
    @venue = Venue.new
  end

  # GET /venues/1/edit
  def edit
  end

  # POST /venues
  # POST /venues.json
  def create
    @venue = Venue.new(venue_params)

    respond_to do |format|
      if @venue.save
        format.html { redirect_to @venue, notice: 'Venue was successfully created.' }
        format.json { render action: 'show', status: :created, location: @venue }
      else
        format.html { render action: 'new' }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /venues/1
  # PATCH/PUT /venues/1.json
  def update
    respond_to do |format|
      if @venue.update(venue_params)
        format.html { redirect_to @venue, notice: 'Venue was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @venue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /venues/1
  # DELETE /venues/1.json
  def destroy
    @venue.destroy
    respond_to do |format|
      format.html { redirect_to venues_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venue
      @venue = Venue.find(params[:id])
    end
    def search_text
      if !params[:search]
         return "There are #{Venue.all.count} Venues in total"
      else
         return "There are #{Venue.near(params[:search]).count} Venues Near #{params[:search].to_s}"
      end
    end
    # Never trust parameters from the scary internet, only allow the white list through.
    def venue_params
      params.require(:venue).permit(:name, :free_wifi, :charging, :website, :latitude, :longitude, :address, :search, :prettyaddress, :address_line_2, :postcode, :offset, :page)
    end
end
