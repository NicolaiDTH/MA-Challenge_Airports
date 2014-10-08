require 'plane'
require 'airport'
	
# # class Airport end

describe Airport do
	let(:airport){Airport.new(:capacity => 100)}
	let(:plane){Plane.new}
	it "allows default capacity on initialization" do
		expect(airport.capacity).to eq 100
	end

		context "taking off and landing" do
			it "allows a plane to land" do
				expect(airport.landed_plane_count).to eq 0
				airport.dock(plane)
				expect(airport.landed_plane_count).to eq 1
		end		
			it "allows a plane to lift off" do
				expect(airport.flying_plane_count).to eq 0
				airport.liftoff(plane)
				expect(airport.flying_plane_count).to eq 1
		end
# 	end

		context "air traffic control" do
			it "stops planes from landing if the airport is full" do
				expect(airport).not_to be_full
				100.times {airport.dock(Plane.new)}
				expect(airport).to be_full
		end

# 		# context "weather conditions" do
# 		# 	it "a plane cannot take off when it is stormy" do

# 		# 	end

# 		# 	it "a plane cannot land when it is stormy" do
# 		# 	end
		end
	end
end