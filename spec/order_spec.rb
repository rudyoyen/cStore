require 'spec_helper'
require 'config'
require 'pry'

describe 'Order' do

	describe '#create' do

		# (type, quantity, promo)

		before { 
			@count_symbol = Config::ITEM_COUNT_SYMBOL 
			@order_with_many_items = {
				"milk"=>{:count=>1999, :wrappers=>1}, 
				"dark"=>{:count=>1995, :wrappers=>1}, 
				"white"=>{:count=>0, :wrappers=>0}, 
				"sugar free"=>{:count=>1997, :wrappers=>1}
			}
			@order_with_no_items = {
				"milk"=>{:count=>0, :wrappers=>0}, 
				"dark"=>{:count=>0, :wrappers=>0}, 
				"white"=>{:count=>0, :wrappers=>0}, 
				"sugar free"=>{:count=>0, :wrappers=>0}
			}
			@order_with_no_promotion_applied = {
				"milk"=>{:count=>3, :wrappers=>3}, 
				"dark"=>{:count=>0, :wrappers=>0}, 
				"white"=>{:count=>0, :wrappers=>0}, 
				"sugar free"=>{:count=>0, :wrappers=>0}
			}
		}

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
	    expect(order).to eq(@order_with_no_promotion_applied)
		end

		it 'returns the correct order with promo and many items' do 
			type = 'milk'
			quantity = 1000
	    order = Order.new(type, quantity, Promo.new(2)).create     
	    expect(order).to eq(@order_with_many_items)
		end

		it 'returns the correct order with promo and 0 items' do 
			type = 'milk'
			quantity = 0
	    order = Order.new(type, quantity, Promo.new(2)).create     
	    expect(order).to eq(@order_with_no_items)
		end

		it 'returns the correct order with promo and many wrappers needed' do 
			type = 'milk'
			quantity = 3
	    order = Order.new(type, quantity, Promo.new(10)).create     
	    expect(order).to eq(@order_with_no_promotion_applied)
		end

		it 'returns the correct order with promo and no wrappers needed' do 
			type = 'milk'
			quantity = 3
	    order = Order.new(type, quantity, Promo.new(0)).create     
	    expect(order).to eq(@order_with_no_promotion_applied)
		end

	end

end