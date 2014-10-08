require 'airport'
require 'flying_errors'
require 'weather'
require 'plane'

describe Airport do

	let(:airport){Airport.new(:capacity => 15)}
	
	context '~ Capacity ~' do

	it 'allows default capacity on initialization' do
		expect(airport.capacity).to eq 15

		end

	end


	context '~ Taking off and landing ~' do

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
			airport.liftoff(plane)
		end

		it 'disallows landed planes from having landed status' do
			plane = double :plane, flying?: false
			airport.dock(plane)
			expect(airport.planes_count).to eq 0
		end

	end


	context '~ The air traffic control ~' do

		before(:each) do
			allow(airport).to receive(:stormy?) {false}
		end

		it 'knows when the airport is full' do
			plane = double :plane, landed!: self, flying?: true
			expect(airport).not_to be_full
			airport.capacity.times {airport.dock(plane)}
			expect(airport).to be_full
		end

		it 'knows when it cannot land anything when full' do
			plane = double :plane, landed!: self, flying?: true
			airport.capacity.times {airport.dock(plane)}
			expect{airport.dock(plane)}.to raise_error(FullAirportError)
		end

	end

	context '~ The air traffic control ALSO ~' do

		before(:each) do
			allow(airport).to receive(:stormy?) {true}
		end

		it 'knows when there is bad weather' do
			expect(airport.stormy?).to be true
		end

		it 'knows when not to fly planes during bad weather' do
			plane = double :plane, takeoff!: self
			expect{airport.liftoff(plane)}.to raise_error(StormyWeatherError)
		end

		it 'knows when not to land planes during bad weather' do
			plane = double :plane, takeoff!: self, flying?: true
			expect{airport.dock(plane)}.to raise_error(StormyWeatherError)
		end

	end

end