require 'plane'
require 'airport'
require 'flying_errors'

describe Plane do
	
	let(:plane){Plane.new}

	it 'is flying when instantiated' do
		expect(plane).to be_flying
	end

	it 'changes to flying when in the air' do
		expect(plane.takeoff!).to be_flying
	end

	it 'changes to landed when when landed' do
		expect(plane.landed!).not_to be_flying
	end

end