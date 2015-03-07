class AddPrettyAddressToVenues < ActiveRecord::Migration
  def change
  	add_column :venues, :prettyaddress, :string

  end
end
