require 'airport'
require 'flying_errors'
require 'weather'
require 'plane'

describe Airport do

	let(:airport){Airport.new(:capacity => 15)}
	
	context 'Airport Capacity' do

	it 'allows default capacity on initialization' do
		expect(airport.capacity).to eq 15

		end

	end


		context 'taking off and landing' do

			before(:each) do
				allow(airport).to receive(:stormy?) {false}
			end

			it 'allows a plane to land' do
				plane = double :plane, landed!: self, flying?: true
				airport.dock(plane)
				expect(airport.airport_planes).to include (plane)
			end

			it 'allows a plane to have the landed! status' do
				plane = double :plane, flying?: true
				expect(plane).to receive(:landed!)
				airport.dock(plane)
			end

			it 'allows a plane to take off' do
				plane = double :plane, landed!: self, flying?: true, takeoff!: self
				airport.dock(plane)
				airport.liftoff(plane)
				expect(airport.airport_planes).not_to include (plane)
			end

			it 'allows a plane to have the flying status' do
				plane = double :plane
				expect(plane).to receive(:takeoff!)
				airport.dock(plane)
			end
			
		end

end