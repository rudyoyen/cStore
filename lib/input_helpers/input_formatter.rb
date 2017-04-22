require_relative '../utilities/string.rb'

class InputFormatter

	def initialize(rows)
		@rows = rows || []
		@formatted_rows = []
	end

	def format_rows
		@rows.each do |row|
			@formatted_rows << format_row(row)
		end
		@formatted_rows
	end

	private
	
		def format_row(row)
			formatted_row = Hash.new
		
			# expecting incoming row to look like: {"cash"=>"12", " price"=>" 2", " wrappers needed"=>" 5", " type"=>" 'milk'"}
			row.each do |label, value|		
				f_label = format_label(label)
				f_value = format_value(value)

				formatted_row[f_label] = f_value
			end
		
			formatted_row
		end

		def format_value(input)
			input = input.strip

			if input.is_integer? 
				value = input.to_i 
			elsif input.is_a? String
				value = input.chomp("'").reverse.chomp("'").reverse
			end

			value
		end

		def format_label(input)
			input.strip
		end

end



