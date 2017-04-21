require 'pry'
class FileWriter

	def initialize(file_name)
		@file_name = file_name
	end

	def prepare_file
		File.new(@file_name, "wb")
	end

	def write(row_contents)
		CSV.open(@file_name, "ab") do |csv|
			csv << row_contents
		end
	end

end