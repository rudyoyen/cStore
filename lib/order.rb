require_relative './config.rb'

class Order

	def initialize (type, quantity, promo)
		@type = type
		@quantity = quantity
		@promo = promo
		@order = Hash.new
	end

	def create
		build_structure

		if type_can_be_created?
			set_quantity
		end

		if promo_exists?
			apply_promo
		end

		@order
	end

	private 

		def count
			Config::ITEM_COUNT_SYMBOL
		end

		def wrappers
			Config::WRAPPER_COUNT_SYMBOL
		end

		def types
			Config::ITEM_TYPES
		end

		def type_can_be_created?
			@order[@type] != nil
		end

		def build_structure
			types.each do |type|
				@order[type] = Hash.new
				@order[type][count] = 0
				@order[type][wrappers] = 0
			end
		end

		def set_quantity
			@order[@type][count] = @quantity 
			@order[@type][wrappers] = @quantity
		end

		def apply_promo
			while promo_can_be_redeemed?
				redeem(find_wrappers_to_redeem)
			end
		end

		def promo_can_be_redeemed?
			find_wrappers_to_redeem != nil
		end

		def find_wrappers_to_redeem
			@order.each do |type, counters|
				if are_enough_wrappers?(counters[wrappers])
					return type 
				end
			end
			nil
		end

		def redeem(type)
			remove_wrappers(type)
			receive_items(type)
		end

		def remove_wrappers(type)
			@order[type][wrappers] = promo_provide_wrappers(@order[type][wrappers])
		end

		def receive_items(type)
			items = promo_get_items(type)
			add_new_items_to_order(items)
		end

		def add_new_items_to_order(items)
			items.each do |type, quantity|
				@order[type][count] += quantity
				@order[type][wrappers] += quantity
			end
		end

		def promo_exists?
			@promo != nil
		end

		# Dependcies on promo class

		def are_enough_wrappers?(wrappers)
			@promo.can_be_redeemed?(wrappers)
		end

		def promo_provide_wrappers(wrappers)
			@promo.receive_wrappers(wrappers)
		end

		def promo_get_items(type)
			@promo.provide_items(type)
		end	


end