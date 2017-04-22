require_relative './config.rb'

class Promo

	def initialize(wrappers_needed)
		@wrappers_needed = wrappers_needed
	end

	def can_be_redeemed?(wrappers)
		if !is_promo_and_wrappers_valid?(wrappers)
			return false
		end
	
		promo_rule(wrappers)
	end	

	def receive_wrappers(wrappers)
		if !is_promo_and_wrappers_valid?(wrappers)
			return false
		end

		calculate_wrappers(wrappers)
	end

	def provide_items(type)
		rules[type] || Hash.new
	end

	private

		def rules
			Config::PROMO_RULES
		end

		def is_promo_valid?
			if !is_wrappers_needed_defined?
				return false
			end

			if !is_wrappers_needed_greater_than_zero?
				return false
			end

			true
		end

		def is_wrappers_needed_defined?
			@wrappers_needed.is_a? Integer
		end

		def is_wrappers_needed_greater_than_zero?
			@wrappers_needed > 0
		end

		def is_wrappers_valid?(wrappers)
			wrappers.is_a? Integer
		end

		def promo_rule(wrappers)
			wrappers >= @wrappers_needed
		end

		def calculate_wrappers(wrappers)
			wrappers - @wrappers_needed > 0 ? wrappers - @wrappers_needed : 0
		end

		def is_promo_and_wrappers_valid?(wrappers)
			is_promo_valid? && is_wrappers_valid?(wrappers)
		end

end