class Product
	attr_reader :title, :price, :stock

	@@products = []	

	def initialize(options={})
		@title = options[:title]
		add_to_products
	end

	def self.all
		@@products
	end

	def self.stock?
		@@products.stock > 0
	end

	private

	def add_to_products
		@@products << self
	end
end