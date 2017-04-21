require 'pry'

class OutputsBuilder

	def initialize(output)
		@raw_output = output
	end

	def format
		# expected input: 
		#  {
		#   	"milk"=>{:count=>7, :wrappers=>7},
 		# 		"dark"=>{:count=>0, :wrappers=>0},
 		# 		"white"=>{:count=>0, :wrappers=>0},
 		# 		"sugar free"=>{:count=>1, :wrappers=>1}
 		# 	}
 		#
		# expected output: ['milk 7', ' dark 0', ' white 0', ' sugar free 1']

		output_array  = @raw_output.map do |type, counters_hash|
			build_item(type, counters_hash)
		end

		output_array.first.strip!	# remove leading whitespace from first element

		output_array
	end

	def build_item(type, counters)
		" #{type} #{counters[:count]}"
	end

end