require 'spec_helper'
require 'config'
require 'pry'

describe 'Order' do

	describe '#create' do

		# (type, quantity, promo)

		before { @count_symbol = Config::ITEM_COUNT_SYMBOL }

		it 'returns a non empty order' do 
			order = Order.new('milk', 5, nil).create 
	    expect(order.keys.length).to be > 0
		end

		it 'returns the correct type of item' do 
			type = 'milk' 
	    order = Order.new(type, 5, nil).create
	    order_has_type_included = order[type] != nil      
	    expect(order_has_type_included).to be true
		end

		it 'returns an order with no quantity if the type doesn\'t match the store\'s options' do 
			type = 'no name'
	    order = Order.new(type, 5, nil).create
	    order_has_type_included = order[type] != nil      
	    expect(order_has_type_included).to be false
		end

		it 'returns an order with no quantity if the type is an empty string' do 
			type = ''
	    order = Order.new(type, 5, nil).create
	    order_has_type_included = order[type] != nil      
	    expect(order_has_type_included).to be false
		end

		it 'returns an order with no quantity if no type is given' do 
			type = nil
	    order = Order.new(type, 5, nil).create
	    order_has_type_included = order[type] != nil      
	    expect(order_has_type_included).to be false
		end

		it 'returns the correct quantity of items when no promotion exists' do 
			type = 'milk'
			quantity = 3
	    order = Order.new(type, quantity, nil).create     
	    expect(order[type][@count_symbol]).to eq(quantity)
		end

		it 'returns the correct quantity of items when promotion exists' do 
			type = 'milk'
			quantity = 100
	    order = Order.new(type, quantity, Promo.new(2)).create  
	    puts "ORDER", order   
	    expect(order[type][@count_symbol]).to eq(199)
		end



	end

end