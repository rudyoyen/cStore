require './config.rb'
require './file_reader.rb'
require './file_writer.rb'
require './inputs_builder.rb'
require './outputs_builder.rb'
require './scenario.rb'


#*** simplify into one module
file_contents = FileReader.new(Config::INPUT_FILE_NAME).read_rows
inputs = InputsBuilder.new(file_contents).format_rows	# make this a factory??


file_writer = FileWriter.new(Config::OUTPUT_FILE_NAME)
file_writer.prepare_file

scenario = Scenario.new

inputs.each do |input|
	output = scenario.run(input)

	#*** Simplify into one module
	formatted_output = OutputsBuilder.new(output).format
	file_writer.write(formatted_output)
end


