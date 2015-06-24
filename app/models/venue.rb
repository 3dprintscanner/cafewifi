class Venue < ActiveRecord::Base
	
	validates :name, presence: true
	# validates :website, length: {minimum: 5}
	validates :latitude, presence: true
	validates :longitude, presence: true
	validates :latitude, uniqueness: true
	validates :longitude, uniqueness: true

	geocoded_by :address
	before_validation :geocode, if: ->(obj){ !obj.longitude.present? || !obj.latitude.present?}
	has_many :reviews
	belongs_to :venue_data
	has_one :venue_data
	belongs_to :user
	
	scope :nearby_places, lambda {|search,limit=50,distance=10| Venue.search(search,limit,distance)}


	def self.search(search,limit=50,distance=10)
		
		if search
			# find(:all, :conditions => ['name LIKE ? OR address LIKE ?', "%#{search}%" ])
			#Venue.where("name LIKE ? OR address LIKE ?", search, search)
			# Venue.near(search)
			Venue.near(search,distance)
		else
			Venue.all

		end
	end


end
