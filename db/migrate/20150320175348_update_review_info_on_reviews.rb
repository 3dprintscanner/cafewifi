class UpdateReviewInfoOnReviews < ActiveRecord::Migration
  def change
  	add_column :reviews, :wifi_upload_speed ,:float
  	add_column :reviews, :wifi_download_speed ,:float
  	add_column :reviews, :signal_strength ,:integer
  	add_column :reviews, :charging_sockets ,:integer
  	add_column :reviews, :number_of_tables ,:integer
  	add_column :reviews, :password_required ,:boolean
  	
  	
  	add_index "reviews", ["venue_id"], name: "index_review_on_venue_id"


  	add_column :reviews, :password_type ,:string
  	add_column :reviews, :spend_required ,:string
  	add_column :reviews, :minimum_acceptable_spend ,:float

  end
end
