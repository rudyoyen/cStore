
require 'pry'


require './config/config.rb'
require './input_helpers/input_builder.rb'
require './output_helpers/output_builder.rb'
require './scenario.rb'

class App

	def initialize(input_file_name, output_file_name)
		@input_file_name = input_file_name
		@output_file_name = output_file_name
	end

	def start
		scenario = Scenario.new

		output_builder = OutputBuilder.new(@output_file_name)

		inputs = InputBuilder.new(@input_file_name).create_inputs

		inputs.each do |input|
			# binding.pry
			output = scenario.run(input)
			output_builder.send(output)
		end
	end

end

app = App.new(Config::INPUT_FILE_NAME, Config::OUTPUT_FILE_NAME)

app.start


