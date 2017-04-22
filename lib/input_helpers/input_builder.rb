require_relative 'input_formatter'
require_relative 'file_reader'

class InputBuilder

	def initialize(file_name)
		@file_name = file_name
	end

	def create_inputs
		unformatted_rows = FileReader.new(@file_name).read_rows
		inputs = InputFormatter.new(unformatted_rows).format_rows	
	end

end