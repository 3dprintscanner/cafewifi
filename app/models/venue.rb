class Venue < ActiveRecord::Base
	
	validates :name, presence: true

	geocoded_by :address
	after_validation :geocode, if: ->(obj){ !obj.longitude.present? || !obj.latitude.present?}
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

	

end
