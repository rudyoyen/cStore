require_relative 'order'

class Store

	def initialize
	end

	def set_up(price, promo)
		set_price(price)
		set_promo(promo)
	end

	def place_order(cash, item_type)
		if !is_price_valid?
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

		def is_price_an_integer?
			@price.is_a? Integer
		end

		def is_price_greater_than_zero?
			@price > 0
		end

		def is_price_valid?
			is_price_an_integer? && is_price_greater_than_zero?
		end

end