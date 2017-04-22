require './promo.rb'
require './store.rb'
# require './shopper.rb'

class Scenario

	def initialize
		@store = Store.new
	end

	def run(inputs)
		price = inputs['price']
		cash = inputs['cash']
		wrappers_needed = inputs['wrappers needed']
		type = inputs['type']

		@store.set_up(price, Promo.new(wrappers_needed))

		order = @store.place_order(cash, type)

		order
	end

end