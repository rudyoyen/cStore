require_relative 'input_helpers/input_builder.rb'
require_relative 'output_helpers/output_builder.rb'
require_relative 'scenario'

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
			output = scenario.run(input)
			output_builder.send(output)
		end
	end

end




