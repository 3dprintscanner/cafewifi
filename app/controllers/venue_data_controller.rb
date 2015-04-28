class VenueDataController < ApplicationController
		def create
		  	@venue_data = Venue_data.new(venue_data_params)

		  	if (@venue_data.save)
		  		redirect_to venue_data_path
		  	end
		  
		end

	private

	def venue_data_params
		params.require(:venue_data).permit(:wifi_upload_speed, :rating, :wifi_download_speed, :signal_strength, :charging_sockets, :number_of_tables, :venue_id, :password_required, :password_type, :spend_required, :minimum_acceptable_spend)
	end

end


