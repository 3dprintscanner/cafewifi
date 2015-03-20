class CreateVenueData < ActiveRecord::Migration
  def change
    create_table :venue_data do |t|
      t.float :wifi_upload_speed
      t.float :wifi_download_speed
      t.integer :signal_strength
      t.integer :charging_sockets
      t.integer :number_of_tables
      t.references :venue, index: true
      t.boolean :password_required
      t.string :password_type
      t.string :spend_required
      t.float :minimum_acceptable_spend

      t.timestamps
    end
  end
end
