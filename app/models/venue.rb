class Venue < ActiveRecord::Base
	geocoded_by :address
	after_validation :geocode
	has_many :reviews
	
	def self.search(search)
		if search
			# find(:all, :conditions => ['name LIKE ? OR address LIKE ?', "%#{search}%" ])
			#Venue.where("name LIKE ? OR address LIKE ?", search, search)
			Venue.near(search)
		else
			Venue.all
		end
	end

	def self.try
		puts 'test text'
	end

end
