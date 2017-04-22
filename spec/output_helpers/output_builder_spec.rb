describe 'OutputBuilder' do

	before { 
		@path = './test_folders/output/redemptions.csv'
		@output_builder = OutputBuilder.new(@path) 
	}
	
	describe '#send' do
		# additional tests are included in file_writer_spec and output_formatter_spec
	  it 'creates file' do
	  	@output_builder.send(output)
	    expect(Pathname.new(@path).exist?).to eq(true) 
	  end
	end

end