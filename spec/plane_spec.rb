require "plane"

describe Plane do

	let(:plane){Plane.new}

	it "has a flying status when created" do
		expect(plane).not_to be_landed
	end

	it "has a flying status when in the air" do
		expect(plane.flying!).not_to be_landed
	end

	it "can take off" do
		expect(plane.takeoff!).not_to be_landed
	end

	it "changes its status to flying after taking off" do
		expect(plane.takeoff!).not_to be_false
	end	
end