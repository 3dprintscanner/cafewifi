class AddExtraAddressData < ActiveRecord::Migration
  def change
  	add_column :venues , :address_line_2, :string
  	add_column :venues, :postcode, :string
  	add_column :venues, :type, :string
  end
end
