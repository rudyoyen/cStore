describe 'OutputFormatter' do

	before { 
		@expected_input = {
	  	"milk"=>{:count=>7, :wrappers=>7},
			"dark"=>{:count=>0, :wrappers=>0},
			"white"=>{:count=>0, :wrappers=>0},
			"sugar free"=>{:count=>1, :wrappers=>1}
		}
		@expected_output = ['milk 7', ' dark 0', ' white 0', ' sugar free 1']
	}

	describe '#format' do
	  
	  it 'expects hash as input, returns empty array if input is not a hash and not null' do
	    output = OutputFormatter.new("random").format
	    expect(output.length).to eq(0)  
	  end

	  it 'returns empty array if empty hash is input' do
	    output = OutputFormatter.new({}).format
	    expect(output.length).to eq(0)  
	  end

	  it 'returns an array' do
	    output = OutputFormatter.new({}).format
	    expect(output.is_a? Array).to eq(true)  
	  end

	  it 'returns correctly formatted output' do
	  	output = OutputFormatter.new(@expected_input).format
	  	expect(output).to eq(@expected_output)
	  end

	end

end