json.array!(@venues) do |venue|
  json.extract! venue, :id, :name, :free_wifi, :charging, :website, :latitude, :longitude
  json.url venue_url(venue, format: :json)
end
