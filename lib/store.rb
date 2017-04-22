require_relative 'order'
require 'pry'

class Store

	def initialize
	end

	def set_up(price, promo)
		set_price(price)
		set_promo(promo)
	end

	def place_order(cash, item_type)
		if @price == nil
			puts "Cannot place order with out price defined."
			return Hash.new
		end

		quantity = calculate_quantity(cash)		
		Order.new(item_type, quantity, @promo).create
	end

	private 

		def calculate_quantity(cash)
			cash / @price
		end

		def set_price(new_price)
			@price = new_price
		end

		def set_promo(new_promo)
			@promo = new_promo
		end

end