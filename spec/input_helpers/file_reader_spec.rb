describe 'FileReader' do

	before { @reader = FileReader.new('./test_folders/input/orders.csv') }

	describe '#read_rows' do

	  it 'returns inputs as an array' do
	    rows = @reader.read_rows
	    expect(rows.is_a? Array).to eq(true)  
	  end

	  it 'returns correct number of rows' do
	    rows = @reader.read_rows
	    expect(rows.length).to eq(4)  
	  end

	  it 'returns rows as non-empty hashes in array' do
	    rows = @reader.read_rows
	    rows.first.keys.length
	    expect(rows.first.keys.length).to be > 0  
	  end

	  it 'returns rows where each row has headers as keys in hash' do
	    rows = @reader.read_rows
	    first_row_labels = rows.first.keys
	    header_names = ['cash', ' price', ' wrappers needed', ' type'] 
	    expect(first_row_labels).to eq(header_names)  
	  end

	end

end