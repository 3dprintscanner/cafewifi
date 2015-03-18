require 'spec_helper'

describe Venue do
  describe "Adding venues" do
  	let!(:valid_attributes){
  		{
  		name: "test name",
  		free_wifi: true,
  		charging: true,
  		website: "www.testwebsite.com",
  		latitude: 31.125,
  		longitude: 1.122,
  		address: "15 Kenmare Road",
  		address_line_2: "Liverpool",
  		postcode: "L15 4HN",
  		# type: "cafe",
  		prettyaddress: "10 Testing close, 2nd address line test, LW15 4NG"}
  		}
  	context 'Adding Valid Venues' do

  		it "should add a venue with valid credentials" do
  			newvenue = Venue.create(valid_attributes)
  			expect(Venue.find_by(valid_attributes)).to be_true		
  		end

  		it "should only allow one instance of the same venue" do
  			2.times {Venue.create(valid_attributes)}
  			expect(Venue.count).to eq(1)
  		end
  	end
  	context 'Adding invalid venues' do
  		let!(:venue){Venue.new(valid_attributes)}
  		it "should reject an entry with no name" do
  			venue.name = ""
  			expect(venue).to_not be_valid
  		end

  		it "should reject an entry with neither longitude nor latitude" do
  			venue.latitude = nil
  			venue.longitude = nil
  			expect(venue).to_not be_valid
  		end

      it "should only return the first 50 with a limit parameter" do
        3.times do |lat|
          valid_attributes['latitude'] =+ (lat*0.1)
          valid_attributes['longitude'] =+ (lat*0.1)
          Venue.create(valid_attributes)
        end
          puts Venue.all.to_json
          expect(Venue.search('Liverpool',1).count).to eq(1)
      end
  	end
  end

end
