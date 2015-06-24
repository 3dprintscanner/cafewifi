class UsersController < ApplicationController

	def show
		if user_signed_in?
			@user = User.find(current_user)
			@user_venues = Venue.find_by_user_id(current_user)
		else
			redirect_to venues_path, notice: "You need to be signed in"
		end
	end


	private

	def user_params
		params.require(:user).permit(:all)
	end
end