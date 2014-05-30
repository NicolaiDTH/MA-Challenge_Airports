class Airport
	DEFAULT_CAPACITY = 100

# 	# include Weather

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
	end
	
	def planes
		@planes ||= []
	end

	def plane_count
		planes.count
	end

	def capacity
		@capacity ||= DEFAULT_CAPACITY
	end

	def capacity=(value)
		@capacity = value
	end

	def dock(plane=nil?)
		raise "The airport is full." if full?
		planes << plane
	end

# 	def liftoff(plane=nil?)
# 		raise "The airport is empty." if empty?
# 	end

	def full?
		plane_count == capacity
	end

# 	def empty?
# 		plane_count == 0
# 	end

# 	def flying_planes
# 		planes.reject {|plane| plane.landed?}
# 	end

# 	def landed_planes
# 		planes.select {|plane| plane.landed?}
# 	end
# end
end