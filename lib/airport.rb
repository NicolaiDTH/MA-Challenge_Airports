require_relative 'weather'
require_relative 'flying_errors'
require_relative 'plane'

class Airport
	DEFAULT_CAPACITY = 15

	include Weather

	attr_accessor(:capacity)

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def airport_planes
		@airport_planes ||= []
	end

	def planes_count
		airport_planes.count
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end

	def dock(plane)		
		raise FullAirportError if full?
		raise StormyWeatherError if stormy?
		if plane.flying?
			airport_planes << plane
			plane.landed!
		end
		
	end

	def liftoff(plane)		
		raise StormyWeatherError if stormy?
		airport_planes.delete(plane)
		plane.takeoff!
	end

	def full?
		airport_planes.count == capacity
	end

end