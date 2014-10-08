class Airport
	DEFAULT_CAPACITY = 100

# 	# include Weather

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end

	def flying_planes
		@planes ||= []
	end

	def landed_planes
		@planes ||= []
	end

	def flying_plane_count
		flying_planes.count
	end

	def landed_plane_count
		landed_planes.count
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end

	def dock(plane=nil?)		
		raise "The airport is full." if full?
		landed_planes << plane
	end

	def liftoff(plane=nil?)		
		flying_planes << plane		
		raise "The airport is now empty." if empty?
	end

	def full?
		landed_plane_count == capacity
	end

	def empty?
		landed_plane_count == 0
	end
end