require 'faderuby'

class Lights::Controller

	def initialize(address, port=7890, matrix)
		@client = FadeRuby::Client.new(address, port)
	end

	def filters
		@filters ||= []
	end

	def filters<<(filter)
		@filters << filter
	end

	def run
		while true
			@client.set_pixels(pixels)
		end
	end
end
