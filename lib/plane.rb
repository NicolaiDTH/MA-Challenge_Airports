class Plane

	def initialize
		flying!
	end

	def landed?
		@landed
	end

	def land!
		@landed = true
		self
	end

	def takeoff!
		@landed = false
		self
	end

	def flying!
		@landed = false
		self
	end
end