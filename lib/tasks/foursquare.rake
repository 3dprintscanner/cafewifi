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
  task another_test: :environment  do
  	#puts Venue.try
  	puts Venue.public_methods
  	# require 'json'
  	include HTTParty
  	#format :json
	  	split = CGI::escape(ENV['NAME']) || 'washington'
	  	# split = 'washington'
	  	print split
		#HTTParty::Basement.default_options.update(verify: false)
		#wifi =HTTParty.get("https://api.foursquare.com/v2/venues/explore?near=#{split}&query=free%20wifi&v=20140808&client_id=XQFBFGAVUQIULDWR2RMRKJD2G3Y21I325C0ZW3AS1UF1KKRQ&client_secret=YIBXDFRLHD5T4PUKPDVRS21W0OHDYDZ4IL1G3URNFZSQY3S3")
		wifi =HTTParty.get("https://api.foursquare.com/v2/venues/explore?near=washington&query=free%20wifi&v=20140808&client_id=XQFBFGAVUQIULDWR2RMRKJD2G3Y21I325C0ZW3AS1UF1KKRQ&client_secret=YIBXDFRLHD5T4PUKPDVRS21W0OHDYDZ4IL1G3URNFZSQY3S3")

		# wifi = wifi.body
		# savefile = File.new("#{Rails.root}/public/#{split}_foursquare_explore_request.json", "w+")
		# savefile = File.new("newfile.txt","w+")
		# savefile.write(wifi)
		# savefile.close
		# File.directory?(savefile)

		# queryfile = File.read("#{Rails.root}/public/#{split}_foursquare_explore_request.json")
		# parsed = JSON.parse(queryfile)
		# puts wifi.reponse
		toadd = []
		results = wifi['response']['groups'][0]["items"]
		# results = wifi['groups'][0]["items"]
		puts 'completed task'
		results.each do |item|
			# puts item
			name = item["venue"]["name"]
			addressline1 = item["venue"]["location"]["address"]
			addressline2 = item["venue"]["location"]["crossStreet"]
			postcode = item["venue"]["location"]["postalCode"]
			free_wifi = true 
			latitude = item["venue"]["location"]["lat"]
			longitude = item["venue"]["location"]["lng"]
			# prettyaddress = item["venue"]["location"]["formattedAddress"]
			# prettyaddress.flatten!
			creation_hash = {:name => name, :free_wifi => true, :address => addressline1, :address_line_2 => addressline2, :postcode => postcode, :latitude => latitude, :longitude => longitude}
			# puts creation_hash
			toadd.push(creation_hash)
		end
		# todadd = toadd.to_json
		# puts toadd
		puts "does toadd responds to the toeach method? #{toadd.respond_to?(:each)}"
		
		toadd.each do |entry|
			puts entry.class
			puts entry
			sleep(1)
			#Venue.create({:name => entry['name'], :free_wifi => entry['free_wifi'], :address => entry['address'], :address_line_2 => entry['address_line_2'], :postcode => entry['postcode'], :latitude => entry['latitude'], :longitude => entry['longitude']})
			Venue.create(entry)
		end
		puts toadd

		
		testentry = toadd.first
		puts "does toadd responds to the toeach method? #{toadd.respond_to?(:each)}"
		# Venue.new(testentry)
		savefile = File.new("newfile.txt","w+")
		savefile.write(toadd)
		savefile.close
		puts testentry
		# Venue.new({:name=>"The Pump House", :free_wifi=>true, :address=>"Merchants Rd", :address_line_2=>nil, :postcode=>"BS8 4PZ", :latitude=>51.448273, :longitude=>-2.617971})
		# Venue.create({name: "The Big Chill Bar", free_wifi: true, address: "15 Small St", address_line_2: "Bell Ln.", postcode:"BS1 1DE", latitude: 51.455195, longitude: -2.595122})
  end
  	
  
end
