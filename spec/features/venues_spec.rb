require 'spec_helper'

describe "Adding Venues"  do
	let!(:venue) {Venue.create(name: "a new cafe", free_wifi: true, charging: true, website: "www.anewcafe.com", latitude: 48.8447, longitude: 2.25)}

	it 'should create a new entry in the venue list' do
		visit '/'
		expect(page).to have_content("a new cafe")				
	end  

end
