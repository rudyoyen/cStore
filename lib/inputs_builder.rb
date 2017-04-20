require 'pry'
require 'pry-nav'
require './string.rb'

class InputsBuilder
	def initialize(contents)
		@contents = contents
	end

	def build
		rows = @contents.split("\n")
		label_row = rows.shift
		@labels = splitRowToArray(label_row)
		createScenarios(rows)
	end

	def createScenarios(rows)
		scenarios = Array.new
		rows.each do |row|
			if !isEmpty?(row)
				scenario_inputs = splitRowToArray(row)
				scenarios << createScenario(scenario_inputs)
			end
		end

		scenarios
	end

	def createScenario(scenario_inputs)
		scenario = Hash.new
		@labels.each_with_index do |label, index|
			input = sanitize(scenario_inputs[index])
			scenario[label] = input
		end
		scenario
	end

	def isEmpty?(row)
		row == ""
	end

	def splitFileContentsToRows(file_text)
		file_text.split("\n")
	end

	def splitRowToArray(row)
		row.split(", ")
	end

	#*** ADD CHECK AGAINST 0 for price or promo!!!
	def sanitize(input)
		if input.is_integer? 
			value = input.to_i 
		elsif input.is_a? String
			value = input.chomp("'").reverse.chomp("'").reverse
		end
		value
	end

end



