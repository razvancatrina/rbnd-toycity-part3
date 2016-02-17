class Transaction
	@@id = 0
	attr_reader :customer, :product

	def initialize(customer, product)
		@@id += 1
		@customer = customer
		@product = product

		@product.stock -= 1
	end

	def id
		@@id
	end
end