class FileWriter

	def initialize(file_name)
		@file_name = file_name
	end

	def prepare_file
		CSV.open(@file_name, "wb") do |csv|
			puts "Preparing FILE"
		end
	end

	def write(row_contents)
		CSV.open(@file_name, "ab") do |csv|
			puts 'writing file'
			csv << row_contents
		end
	end

end