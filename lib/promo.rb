require 'pry'
require_relative './config.rb'

class Promo

	def initialize(wrappers_needed)
		@wrappers_needed = wrappers_needed
	end

	def can_be_redeemed?(wrappers)
		if is_not_a_number?(wrappers)
			return false
		end
		wrappers >= @wrappers_needed 
	end

	def receive_wrappers(wrappers)
		if is_not_a_number?(wrappers)
			return false
		end
		wrappers - @wrappers_needed > 0 ? wrappers - @wrappers_needed : 0
	end

	def provide_items(type)
		rules[type] || Hash.new
	end

	private

		def rules
			Config::PROMO_RULES
		end

		def is_not_a_number?(value)
			!value.is_a? Integer
		end


end