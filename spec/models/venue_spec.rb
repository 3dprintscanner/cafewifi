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

  		it "should geocode an entry with neither longitude nor latitude" do
        newAttributes = valid_attributes
        newAttributes["latitude"] = nil
        newAttributes["longitude"] = nil

        newVenue = Venue.create(newAttributes)

  			expect(venue["latitude"]).to_not be_nil
        expect(venue["longitude"]).to_not be_nil
  		end

      it "should only return the first 50 with a limit parameter" do            
          Venue.create(valid_attributes)
          newAttributes = valid_attributes
          newAttributes["latitude"] = 35
          newAttributes["longitude"] = 12
          binding.pry
          puts Venue.all.to_json
          expect(Venue.search('Liverpool').count).to eq(1)
      end
  	end
  end

end
