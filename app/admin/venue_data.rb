ActiveAdmin.register VenueData do


  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if resource.something?
  #   permitted
  # end
permit_params :wifi_upload_speed, :wifi_download_speed, :signal_strength, :charging_sockets, :number_of_tables, :venue_id, :password_required, :password_type, :spend_required, :minimum_acceptable_spend

end
