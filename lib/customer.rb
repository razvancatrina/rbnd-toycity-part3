class Customer
	@@customers = []

	def initialize(options={})
		@@customers << self
	end
end