module Constants
	INPUT_FILE = '../input/orders.csv'
	OUTPUT_FILE = '../output/redemptions.csv'
	LABELS = {
		'cash' => 'cash',
		'price' => 'price',
		'wrappers needed' => 'wrappers_needed',
		'type' => 'type'
	}
	TYPES = ['milk', 'dark', 'white', 'sugar free']

	def Constants.build_order
		order = Hash.new
		TYPES.each do |type|
			sym = string_to_symbol(type)
			order[type] = Hash.new
			order[type][:count] = 0
			order[type][:wrappers] = 0
		end
		order
	end

	def Constants.string_to_symbol(string)
		string.gsub(/\s+/,"_").downcase.to_sym
	end
end