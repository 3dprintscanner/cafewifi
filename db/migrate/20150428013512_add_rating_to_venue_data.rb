class AddRatingToVenueData < ActiveRecord::Migration
  def change
  	add_column :venue_data, :rating, :integer
  end
end
