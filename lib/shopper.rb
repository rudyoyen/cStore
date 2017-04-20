class Shopper

	def initialize(cash)
		@cash = cash
		@items = Hash.new
	end

	def buyItems(store, item_type)
		@items = store.sell(@cash, item_type)
	end

	def itemsCount
		puts @items
	end

end