describe 'InputBuilder' do

	before { @input_builder = InputBuilder.new('./test_folders/input/orders.csv') }
	
	describe '#create_inputs' do
	  it 'returns inputs as an array' do
	    inputs = @input_builder.create_inputs
	    expect(inputs.is_a? Array).to eq(true)  
	  end
	end

end