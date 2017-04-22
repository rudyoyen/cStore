module Config
	INPUT_FILE_NAME = './input/orders.csv'
	OUTPUT_FILE_NAME = './output/redemptions.csv'
	PROMO_RULES = {
		'milk' => {'milk' => 1, 'sugar free' => 1},
		'white' => {'white' => 1, 'sugar free' => 1},
		'sugar free' => {'sugar free' => 1, 'dark' => 1},
		'dark' => {'dark' => 1}
	}
	ITEM_TYPES = ['milk', 'dark', 'white', 'sugar free']
	ITEM_COUNT_SYMBOL = :count
	WRAPPER_COUNT_SYMBOL = :wrappers
end