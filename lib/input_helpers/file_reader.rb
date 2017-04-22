require 'csv'

class FileReader
	
	def initialize(file_name)
		@file_name = file_name
		@rows = [] 
	end

	def read_rows
		CSV.foreach(@file_name, :headers => true) do |row|
			add_row(row)
		end
		@rows
	end

	private 

		def add_row(row)
			if has_contents?(row)
				@rows << row.to_hash		
			end
		end

		def has_contents?(array)
			array.length > 0
		end

end