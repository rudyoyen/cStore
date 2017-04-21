require './constants.rb'
require './file_reader.rb'
require './file_writer.rb'
require './inputs_builder.rb'
require './outputs_builder.rb'
require './scenario.rb'
require 'csv'

#*** simplify into one module
file_contents = FileReader.new(Constants::INPUT_FILE).read_rows
inputs = InputsBuilder.new(file_contents).format_rows	# make this a factory??


file_writer = FileWriter.new(Constants::OUTPUT_FILE)
file_writer.prepare_file

inputs.each do |input|
	scenario = Scenario.new(input)
	output = scenario.run

	#*** Simplify into one module
	formatted_output = OutputsBuilder.new(output).format

	file_writer.write(formatted_output)
end


