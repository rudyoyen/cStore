require 'spec_helper'
require 'config'

describe 'Scenario' do
	before { 
		@scenario  = Scenario.new 
		@count_symbol = Config::ITEM_COUNT_SYMBOL
	}


	describe '#run' do
	  it 'returns an output as a Hash' do
	    order = @scenario.run({"cash"=>12, "price"=>2, "wrappers needed"=>5, "type"=>"milk"})         
	    expect(order.is_a? Hash).to eq(true) 
	  end
	  it 'returns an order with the item requested' do
	  	order = @scenario.run({"cash"=>12, "price"=>2, "wrappers needed"=>5, "type"=>"milk"})         
	    expect(order['milk'][@count_symbol]).to be > 0
	  end
	end

end
