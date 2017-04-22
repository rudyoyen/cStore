require_relative 'file_writer'
require_relative 'output_formatter'


class OutputBuilder

	def initialize(file_name)
		@file_name = file_name
		@file_writer = FileWriter.new(file_name).prepare_file
	end

	def send(raw_output)
		formatted_output = OutputFormatter.new(raw_output).format
		@file_writer.write(formatted_output)
	end

end