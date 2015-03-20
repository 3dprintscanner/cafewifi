class VenueData < ActiveRecord::Base
  has_one :venue
  belongs_to :venue

end