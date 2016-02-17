class Customer
	attr_reader :name
	@@customers = []

	def initialize(options={})
		@name = options[:name]
		add_to_customers
	end

	def self.all
		@@customers
	end

	def self.find_by_name(customer_name)
		@@customers.select{ |customer| customer.name == customer_name}.first
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