require 'pry'
require_relative './config/config.rb'

class Promo

	def initialize(wrappers_needed)
		@wrappers_needed = wrappers_needed
	end

	def can_be_redeemed?(wrappers)
		wrappers >= @wrappers_needed 
	end

	def receive_wrappers(wrappers)
		wrappers - @wrappers_needed
	end

	def provide_items(type)
		rules[type] || Hash.new
	end

	private
		def rules
			Config::PROMO_RULES
		end

end