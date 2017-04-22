require 'spec_helper'
require 'config'

describe 'Store' do

	before { 		 
		@count_symbol = Config::ITEM_COUNT_SYMBOL
		@cash = 6
		@type = 'milk'
	}

	describe '#set_up' do
	  it 'allows an order to placed without error' do  
	  	store = Store.new
	  	store.set_up(2, nil)
	  	order = store.place_order(@cash, @type)
	    expect(order.keys.length).to be > 0
	  end
	end

	describe '#place_order' do

		def set_up_store
			store  = Store.new
			price = 2
			promo = nil
			store.set_up(price, promo) 
			store  
		end

		before { @store = set_up_store }

		it 'returns a non empty order' do  
			order = @store.place_order(@cash, @type)     
	    expect(order.keys.length).to be > 0
		end

		it 'returns the correct type of item' do  
	    order = @store.place_order(@cash, @type) 
	    order_has_type_included = order[@type] != nil      
	    expect(order_has_type_included).to be true
		end

		it 'returns the correct quantity of items when no promotion exists' do 
	    order = @store.place_order(@cash, @type)       
	    expect(order[@type][@count_symbol]).to be 3
		end

		it 'returns empty order if price is not an integer' do
			store  = Store.new
			price = nil
			promo = nil
			store.set_up(price, promo) 
			order = store.place_order(@cash, @type)
			expect(order.keys.length).to eq(0) 
		end

		it 'returns empty order if price is not greater than 0' do
			store  = Store.new
			price = 0
			promo = nil
			store.set_up(price, promo) 
			order = store.place_order(@cash, @type)
			expect(order.keys.length).to eq(0) 
		end


	end

end
