require 'spec_helper'



describe "Adding Venues"  do
	# let!(:venue) {Venue.create(name: "a new cafe", free_wifi: true, charging: true, website: "www.anewcafe.com", latitude: 48.8447, longitude: 2.25)}
	let!(:liverpool_attributes){{name: "Crowne Plaza", free_wifi: true, charging: nil, website: nil, latitude: 53.34768212671975, longitude: -2.880563735961914, address: "Liverpool Airport", address_line_2: nil, postcode: "L24 8QD"}}
	let!(:seattle_attributes){{name: "The Paramount Hotel Seattle", free_wifi: true, charging: nil, website: nil, latitude: 33.0514382, longitude: -116.8713134, address: "724 Pine St", address_line_2: "btwn 7th & 8th", postcode: "98101"}}

	it 'should create a new entry in the venue list' do
		Venue.create(name: "a new cafe", free_wifi: true, charging: true, website: "www.anewcafe.com", latitude: 48.8447, longitude: 2.25)
		visit '/'
		expect(page).to have_content("a new cafe")				
	end  

	it "should show an entry close to the search parameter location " do
		Venue.create(liverpool_attributes)
		visit '/'
		fill_in 'search', with: "Liverpool"
		click_link("Search")
		expect(page).to_not have_content("No places match your query")
		expect(page).to have_content("Crowne Plaza")
		expect(page).to have_content("There are 1 Venues Near Liverpool")
	end

	it "should not show an entry that is not close to the search location" do
		Venue.create(liverpool_attributes)
		Venue.create(seattle_attributes)
		visit '/'											
		fill_in 'search', with: "Liverpool"
		click_link("Search")
		expect(page).to_not have_content("No places match your query")
		expect(page).to_not have_content("The Paramount Hotel Seattle")
	end																																																																																																																																																																																																																																																																																																																																																																																																																																																																																																											

	it "should show that no entries are found near your search location" do
		Venue.create(liverpool_attributes)
		Venue.create(seattle_attributes)
		visit '/'
		fill_in 'search', with: "New York"
		click_link("Search")
		expect(page).to have_content("No places match your query")
	end

	it "should only fetch the first 50 results on the main page" do
		75.times do |lat|
			liverpool_attributes['latitude'] = lat
			liverpool_attributes['longitude'] = lat
			Venue.create(liverpool_attributes)
		end
		visit '/'
		expect(page).to have_content('Crowne Plaza')
		page.should.have_css?("div result")
	end

end
