class Transaction
	@@id = 0
	@@transactions = {}
	attr_reader :customer, :product

	def initialize(customer, product)

		if @product.stock < 0 
			raise OutOfStockError, "OutOfStockError: '#{@product.title} is out of stock."
		end

		@@id += 1
		@customer = customer
		@product = product

		@product.stock = @product.stock - 1

		@@transactions[@@id] = self
	end

	def self.all
		@@transactions
	end

	def self.find(transaction_id)
		@@transactions[transaction_id]
	end

	def id
		@@id
	end
end