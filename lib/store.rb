require './order.rb'
require 'pry'

class Store

	def initialize()
		@price = nil
		@promo = nil
	end

	def set_up(price, promo)
		@price = price
		@promo = promo
	end

	def place_order(cash, item_type)
		quantity = calculate_quantity(cash)		
		Order.new(item_type, quantity, @promo).create
	end

	def calculate_quantity(cash)
		cash / @price
	end

end