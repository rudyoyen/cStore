require './constants.rb'
require './file_reader.rb'
require './inputs_builder.rb'
require './scenario.rb'

file_contents = FileReader.new(Constants::INPUT_FILE).read



inputs = InputsBuilder.new(file_contents).build	# make this a factory??

inputs.each do |input|
	scenario = Scenario.new(input)
	output = scenario.run
	# file_writer(output)
end
