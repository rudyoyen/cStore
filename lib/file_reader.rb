class FileReader
	
	def initialize(filename)
		@filename = filename
	end

	def read
		open(@filename).read
	end

end