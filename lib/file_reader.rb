require 'pry'

class FileReader
	
	def initialize(file_name)
		@file_name = file_name
		# @headers = []
		@rows = [] 
	end

	# def read_headers
	# 	@headers = CSV.open(@file_name, 'rb') { |csv| csv.first }
	# end

	def read_rows
		CSV.foreach(@file_name, :headers => true) do |row|
			add_row(row)
		end
		@rows
	end

	# def read
	# 	read_rows
	# end

	def add_row(row)
		if has_contents?(row)
			@rows << row.to_hash		
		end
	end

	def has_contents?(array)
		array.length > 0
	end

end