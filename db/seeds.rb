# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'json'


seedfile = File.read("#{Rails.root}/public/sample_venues.json")

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
