describe 'InputFormatter' do
	
	describe '#format_rows' do
	  it 'returns inputs as an array' do
	    inputs = InputFormatter.new([{},{}]).format_rows	
	    expect(inputs.is_a? Array).to eq(true)  
	  end

	  it 'returns empty array if no input is provided' do
	    inputs = InputFormatter.new(nil).format_rows	
	    expect(inputs).to eq([])  
	  end

	  it 'returns each input with leading and trailing whitespace removed' do
	    inputs = InputFormatter.new([{" type " => " milk "}]).format_rows	
	    expect(inputs).to eq([{"type" => "milk"}])  
	  end

	  it 'returns each input with extra single quotes(\') removed from values' do
	    inputs = InputFormatter.new([{" type " => " 'milk' "}]).format_rows	
	    expect(inputs).to eq([{"type" => "milk"}])  
	  end

	  it 'returns each input with numbers as string types converted to integers' do
	    inputs = InputFormatter.new([{"cash" => "12"}]).format_rows	
	    expect(inputs).to eq([{"cash" => 12}])  
	  end

	end

end