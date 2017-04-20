require './order.rb'
require './constants.rb'
require 'pry'

class Store

	def initialize(price, promo)
		@price = price
		@promo = promo
		@order = nil
	end

	def buy(cash, item_type)
		order = initiate_purchase(cash, item_type)
		if promo_exists?
			@promo.apply(order)
		end
		order
	end

	def initiate_purchase(cash, item_type)
		puts "spending #{cash}, for #{item_type}"
		quantity = cash / @price
		order = Constants::build_order
		order[item_type][:count] = quantity
		order[item_type][:wrappers] = quantity
		# binding.pry
		order
	end

	def promo_exists?
		@promo != nil
	end


end