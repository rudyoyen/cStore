require_relative 'inputs_formatter'
require_relative 'file_reader'

class InputBuilder

	def initialize(file_name)
		@file_name = file_name
	end

	def create_inputs
		file_contents = FileReader.new(@file_name).read_rows
		inputs = InputsFormatter.new(file_contents).format_rows	
	end


end