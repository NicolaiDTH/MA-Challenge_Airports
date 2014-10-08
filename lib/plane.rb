class Plane

	def initialize
		takeoff!
	end

	def flying?
		@flying
	end

	def takeoff!
		@flying = true
		self
	end

	def landed!
		@flying = false
		self
	end
end