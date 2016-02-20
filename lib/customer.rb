class Customer
	attr_reader :name, :address
	@@customers = []

	def initialize(options={})
		@name = options[:name]
		@address = options[:address]
		add_to_customers
	end

	def self.all
		@@customers
	end

	def self.find_by_name(customer_name)
		@@customers.select{ |customer| customer.name == customer_name}.first
	end

	def purchase(product)
		transaction = Transaction.new(self, product);
	end

	private 

	def add_to_customers
		if @@customers.any?{ |customer| customer.name == @name }
			raise DuplicateCustomerError, "DuplicateCustomerError: '#{@name} already exists"
		else
			@@customers << self
		end
	end
end