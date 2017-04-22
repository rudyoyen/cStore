require 'spec_helper'
require 'config'

describe 'Promo' do
	
	before { 
		@wrappers_needed = 3
		@promo  = Promo.new(@wrappers_needed) 
		@rules = Config::PROMO_RULES
	}

	describe '#can_be_redeemed' do
	  it 'returns true if promo can be redeemed' do
	    wrappers = 4         
	    expect(@promo.can_be_redeemed?(wrappers)).to eq(true) 
	  end
	  it 'returns false if promo cannot be redeemed' do 
	  	wrappers = 2         
	    expect(@promo.can_be_redeemed?(wrappers)).to eq(false)
	  end
	  it 'returns false if wrappers is not a number' do 
	  	wrappers = nil         
	    expect(@promo.can_be_redeemed?(wrappers)).to eq(false)
	  end
	  it 'returns false if wrappers_needed is 0 or less' do 
	  	promo = Promo.new(0)
	  	wrappers = 4      
	    expect(promo.can_be_redeemed?(wrappers)).to eq(false)
	  end
	  it 'returns false if wrappers_needed is not a number' do 
	  	promo = Promo.new(nil)
	  	wrappers = 4      
	    expect(promo.can_be_redeemed?(wrappers)).to eq(false)
	  end
	end

	describe '#receive_wrappers' do
	  it 'returns correct number of wrappers received if greater than wrappers needed' do
	    wrappers = 4         
	    expect(@promo.receive_wrappers(wrappers)).to eq(1) 
	  end
	  it 'returns zero wrappers received if less than wrappers needed' do
	    wrappers = 2       
	    expect(@promo.receive_wrappers(wrappers)).to eq(0) 
	  end
	  it 'returns false if wrappers is not a number' do 
	  	wrappers = nil         
	    expect(@promo.receive_wrappers(wrappers)).to eq(false)
	  end
	end

	describe '#provide_items' do
	  it 'returns correct items based on promo rules' do
	    type = 'milk'  
	    redeemed_items = @rules[type]       
	    expect(@promo.provide_items(type)).to eq(redeemed_items) 
	  end
	  it 'returns an empty Hash if item does not match any rules' do 
	  	type = nil         
	    expect(@promo.provide_items(type)).to eq(Hash.new)
	  end
	end

end
