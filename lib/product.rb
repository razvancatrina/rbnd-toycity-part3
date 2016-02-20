class Product
	attr_reader :title, :price, :stock, :description

	@@products = []	

	def initialize(options={})
		@title = options[:title]
		@price = options[:price]
		@stock = options[:stock]
		@description = options[:description]
		add_to_products
	end

	def self.all
		@@products
	end

	def self.stock?
		@@products.stock > 0
	end

	def in_stock?
		@stock > 0
	end

	def stock=(value)
		@stock = value
	end

	def self.in_stock
		@@products.select{ |product| product.in_stock? }
	end

	def self.find_by_title(product_title)
		@@products.select{ |product| product.title == product_title}.first
	end

	private

	def add_to_products
		if @@products.any?{ |product| product.title == @title }
			raise DuplicateProductError, "DuplicateProductError: '#{@title} already exists"
		else
			@@products << self
		end
	end
end