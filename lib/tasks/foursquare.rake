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

  desc "TODO"
  task add_city: :environment do

  	require 'json'
  	city = CGI::escape(ENV['CITY'])


	seedfile = File.read("#{Rails.root}/public/#{city}_foursquare_explore_request.json")

	# parsed = JSON.parse(seedfile)

	seedfile['response']['groups'][0]["items"].each do |item|
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
  
  desc "TODO"
    desc "testing encapsulated http requests"
  task test_task: :environment do
  	if CGI::escape(ENV['CITY'])
  		split = CGI::escape(ENV['CITY'])
  	else
  		puts "No target city specified"
  		raise 'No Target City Specified'
  	end

  	class SquareRequest
  		include HTTParty
  		require 'json'
  		# @base_string = "https://api.foursquare.com/v2/venues/explore?near=washington&query=free%20wifi&v=20140808&client_id=XQFBFGAVUQIULDWR2RMRKJD2G3Y21I325C0ZW3AS1UF1KKRQ&client_secret=YIBXDFRLHD5T4PUKPDVRS21W0OHDYDZ4IL1G3URNFZSQY3S3"

  		def initialize(target)
  		  	@target=target
  		end

  		def getFoursquare
  			response = HTTParty.get(@base_string = "https://api.foursquare.com/v2/venues/explore?near=#{@target}&query=free%20wifi&v=20140808&client_id=XQFBFGAVUQIULDWR2RMRKJD2G3Y21I325C0ZW3AS1UF1KKRQ&client_secret=YIBXDFRLHD5T4PUKPDVRS21W0OHDYDZ4IL1G3URNFZSQY3S3")	
  		  	JSON.parse(response.body)
  		end
  	end

  	wifi = SquareRequest.new(split)
  	wifi = wifi.getFoursquare
  	toadd = []
		results = wifi['response']['groups'][0]["items"]
		# results = wifi.response.body['groups'].first["items"]
		puts results

		puts results.class
		puts results.respond_to?(:each)

		# results = wifi['groups'][0]["items"]
		puts 'completed task'
		puts results.size
		results.each do |item|
			# puts item
			name = item["venue"]["name"]
			puts name.class
			addressline1 = item["venue"]["location"]["address"]
			addressline2 = item["venue"]["location"]["crossStreet"]
			postcode = item["venue"]["location"]["postalCode"]
			free_wifi = true 
			latitude = item["venue"]["location"]["lat"]
			longitude = item["venue"]["location"]["lng"]
			# prettyaddress = item["venue"]["location"]["formattedAddress"]
			# prettyaddress.flatten!
			Venue.create({name: name, free_wifi: true, address: addressline1, address_line_2: addressline2, postcode: postcode, latitude: latitude, longitude: longitude})
		end



  end
end
