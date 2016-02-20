class Transaction
	@@id = 0
	@@transactions = {}
	attr_reader :customer, :product

	def initialize(customer, product)
		@customer = customer
		@product = product

		if @product.stock <= 0 #the stock should not be less than zero but maybe we should be defensive here
			#raise OutOfStockError, "OutOfStockError: '#{@product.title} is out of stock."
		end

		@@id += 1
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

	def self.print_transactions_details
		@@transactions.each { |key, value|
			puts "Transaction id = #{key} - Customer '#{value.customer.name}' bought Product '#{value.product.title}'"
		}
	end
end