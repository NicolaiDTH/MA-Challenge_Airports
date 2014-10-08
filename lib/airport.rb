require_relative 'weather'
require_relative 'flying_errors'

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
		airport_planes.planes_count
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
		if plane.flying = false
			return nil
		else
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
		landed_plane_count == capacity
	end

end