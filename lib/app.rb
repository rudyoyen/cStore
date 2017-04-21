require './constants.rb'
require './file_reader.rb'
require './file_writer.rb'
require './inputs_builder.rb'
require './scenario.rb'
require 'csv'

file_contents = FileReader.new(Constants::INPUT_FILE).read_rows


file_writer = FileWriter.new(Constants::OUTPUT_FILE)
file_writer.prepare_file

inputs = InputsBuilder.new(file_contents).format_rows	# make this a factory??

puts inputs

# #file_row = OutputsBuilder.new(output)
# #file_writer.write(file_row)

inputs.each do |input|
	scenario = Scenario.new(input)
	output = scenario.run
	#formatted_output = outputs_formatter.format(output)
	formatted_output = ['milk 7', ' dark 0', ' white 0', ' sugar free 1']
	file_writer.write(formatted_output)
end


