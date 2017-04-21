require './promo.rb'
require './store.rb'
require './shopper.rb'

class Scenario

	def initialize(inputs)
		@price = inputs['price']
		@cash = inputs['cash']
		@wrappers_needed = inputs['wrappers needed']
		@type = inputs['type']
	end

	def run
		promo = Promo.new(@wrappers_needed)
		store = Store.new(@price, promo)

		order = store.buy(@cash, @type)

		# regardless of design, return order
		order
	end


end