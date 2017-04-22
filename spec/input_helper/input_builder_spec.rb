

describe 'InputBuilder' do
	describe '#cool' do
	  it 'returns true' do
	    ib = InputBuilder.new("INPUT_FILE_NAME")         # Given
	    message = ib.cool 
	    expect(message).to eq(true)  # Then
	  end
	end

end