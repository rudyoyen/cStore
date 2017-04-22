require 'spec_helper'


describe 'Scenario' do
	describe '#run' do
	  it 'produces an output' do
	    scenario  = Scenario.new         # Given
	    order = scenario.run({"cash"=>12, "price"=>2, "wrappers needed"=>5, "type"=>"milk"})           # When
	    expect(order.is_a? Hash).to eq(true)  # Then
	  end
	end

end
