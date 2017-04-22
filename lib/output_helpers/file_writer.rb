require 'csv'

class FileWriter

	def initialize(file_name)
		# binding.pry
		@file_name = file_name
	end

	def prepare_file
		File.new(@file_name, "wb")
		return self
	end

	def write(row_contents)
		CSV.open(@file_name, "ab") do |csv|
			csv << row_contents
		end
	end

end