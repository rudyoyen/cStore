require_relative '../config.rb'

class OutputFormatter

	def initialize(output)
		@raw_output = output
	end

	# expected input: 
	#  {
	#   	"milk"=>{:count=>7, :wrappers=>7},
	# 		"dark"=>{:count=>0, :wrappers=>0},
	# 		"white"=>{:count=>0, :wrappers=>0},
	# 		"sugar free"=>{:count=>1, :wrappers=>1}
	# 	}
	#
	# expected output: ['milk 7', ' dark 0', ' white 0', ' sugar free 1']

	def format
		if !is_raw_output_a_hash?
			return []
		end

		@output_array  = @raw_output.map do |type, counters_hash|
			build_item(type, counters_hash)
		end

		if !output_array_is_empty?
			remove_leading_whitespce_from_first_element
		end

		@output_array
	end

	private

		def count
			Config::ITEM_COUNT_SYMBOL
		end

		def build_item(type, counters)
			" #{type} #{counters[count]}"
		end

		def output_array_is_empty?
			@output_array.length == 0
		end

		def remove_leading_whitespce_from_first_element
			@output_array.first.strip!
		end	

		def is_raw_output_a_hash?
			@raw_output.is_a? Hash
		end
end