class Lights::Pattern::Fade < Lights::Pattern

	def run
		while true
			client.set_pixels(pixels.map{|i| [rand(255), rand(255), rand(255)] }.flatten, 0)
			sleep 2
		end
	end

end