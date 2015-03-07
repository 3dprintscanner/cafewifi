namespace :foursquare do
  desc "TODO"
  task add_london: :environment do

  	require 'json'


	seedfile = File.read("#{Rails.root}/public/londonwifi.json")

	parsed = JSON.parse(seedfile)

	parsed['response']['groups'][0]["items"].each do |item|
	puts "the venue name is #{item["venue"]["name"]}"
	puts "the location is #{item["venue"]["location"]["address"]}"
	puts "the longitude is #{item["venue"]["location"]["lng"]}"
	puts "the latitude is #{item["venue"]["location"]["lat"]}"
	name = item["venue"]["name"]
	addressline1 = item["venue"]["location"]["address"]
	addressline2 = item["venue"]["location"]["crossStreet"]
	postcode = item["venue"]["location"]["postalCode"]
	free_wifi = true 
	latitude = item["venue"]["location"]["lat"]
	longitude = item["venue"]["location"]["lng"]
	prettyaddress = item["venue"]["location"]["formattedAddress"]
	Venue.create({name: name, free_wifi: true, address: addressline1, address_line_2: addressline2, postcode: postcode, latitude: latitude, longitude: longitude})
		end

  end

  desc "TODO"
  task add_ny: :environment do

  	require 'json'


	seedfile = File.read("#{Rails.root}/public/nywifi.json")

	parsed = JSON.parse(seedfile)

	parsed['response']['groups'][0]["items"].each do |item|
	puts "the venue name is #{item["venue"]["name"]}"
	puts "the location is #{item["venue"]["location"]["address"]}"
	puts "the longitude is #{item["venue"]["location"]["lng"]}"
	puts "the latitude is #{item["venue"]["location"]["lat"]}"
	name = item["venue"]["name"]
	addressline1 = item["venue"]["location"]["address"]
	addressline2 = item["venue"]["location"]["crossStreet"]
	postcode = item["venue"]["location"]["postalCode"]
	free_wifi = true 
	latitude = item["venue"]["location"]["lat"]
	longitude = item["venue"]["location"]["lng"]
	Venue.create({name: name, free_wifi: true, address: addressline1, address_line_2: addressline2, postcode: postcode, latitude: latitude, longitude: longitude})
		end

  end

end
