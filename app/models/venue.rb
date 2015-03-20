class Venue < ActiveRecord::Base
	
	validates :name, presence: true
	# validates :website, length: {minimum: 5}
	validates :latitude, presence: true
	validates :longitude, presence: true
	validates :latitude, uniqueness: true
	validates :longitude, uniqueness: true

	geocoded_by :address
	after_validation :geocode, if: ->(obj){ !obj.longitude.present? || !obj.latitude.present?}
	has_many :reviews
	belongs_to :venue_data
	has_one :venue_data
	
	scope :nearby_places, lambda {|search,limit=50| Venue.search(search,limit)}

	def self.search(search,limit=50)
		
		if search
			# find(:all, :conditions => ['name LIKE ? OR address LIKE ?', "%#{search}%" ])
			#Venue.where("name LIKE ? OR address LIKE ?", search, search)
			# Venue.near(search)
			Venue.near(search)
		else
			Venue.all
		end
	end


end
