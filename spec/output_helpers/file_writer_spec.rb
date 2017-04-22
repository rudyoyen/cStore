describe 'FileWriter' do 

	before { @path = './test_folders/output/redemptions.csv' }
	
	describe '#prepare_file' do
	  it 'creates a new file in the specified directory' do
	  	FileWriter.new(@path).prepare_file
	    expect(Pathname.new(@path).exist?).to eq(true)  
	  end
	end

	describe '#write' do
	  it 'it writes specified contents to the file' do
	  	file_writer = FileWriter.new(@path).prepare_file
	  	original_content = "milk, 3"
	  	expected_written_content = "\"milk, 3\"\n"
	  	
	  	file_writer.write([original_content])
	  	actual_written_content = open(@path).read
	    expect(expected_written_content).to eq(actual_written_content)  
	  end
	end

end