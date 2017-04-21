require 'pry'
class Promo

	def initialize(wrappers_needed)
		@wrappers_needed = wrappers_needed
		# @rules = rules
		@order = nil
	end

	# - When a shopper trades the required number of:
 #  - `milk` wrappers they will receive one complimentary `milk` chocolate and one complimentary `sugar free` chocolate.
 #  - `white` wrappers they will receive one complimentary `white` chocolate and one complimentary `sugar free` chocolate.
 #  - `sugar free` wrappers they will receive one complimentary `sugar free` chocolate and one complimentary `dark`
 #  chocolate.
 #  - `dark` wrappers they will receive one complimentary `dark` chocolate.


	def rules
		rules = Hash.new	
		rules['milk'] = {'milk' => 1, 'sugar free' => 1}
		rules['white'] = {'white' => 1, 'sugar free' => 1}
		rules['sugar free'] = {'sugar free' => 1, 'dark' => 1}
		rules['dark'] = {'dark' => 1}
		rules
	end

	def apply(order)
		@order = order

		while promo_can_be_redeemed?
			type = find_wrappers_to_redeem
			redeem(type)
		end

		@order
	end

	def promo_can_be_redeemed?
		@order.each do |type, counters|
			if counters[:wrappers] >= @wrappers_needed
				return true 
			end
		end
		false 
	end

	def find_wrappers_to_redeem
		@order.each do |type, counters|
			if counters[:wrappers] >= @wrappers_needed
				return type 
			end
		end
		nil
	end

	def redeem(type)
		receive_wrappers(type)
		give_free_items(type)
	end

	def receive_wrappers(type)
		@order[type][:wrappers] = @order[type][:wrappers] - @wrappers_needed
	end

	def give_free_items(type)
		items = rules[type] || Hash.new
		add_new_items_to_order(items)
	end

	def add_new_items_to_order(items)
		items.each do |type, quantity|
			@order[type][:count] += quantity
			@order[type][:wrappers] += quantity
		end
	end



end