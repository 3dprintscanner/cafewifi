class Venue < ActiveRecord::Base
	geocoded_by :address
	after_validation :geocode

	def self.search(search)
		if search
			# find(:all, :conditions => ['name LIKE ? OR address LIKE ?', "%#{search}%" ])
			#Venue.where("name LIKE ? OR address LIKE ?", search, search)
			Venue.near(search)
		else
			Venue.all
		end
	end

	def self.add_from_rake(params)
		Venue.new(params)
	end
	def self.try
		puts 'test text'
	end

end
