
require "faderuby"

client = FadeRuby::Client.new("10.100.131.22", 7890)

strip = FadeRuby::Strip.new(50)


length = strip.pixels.length
at = 0
direction = 1

while true
	strip.pixels.each do |pix|
		pix.set(r: 0, g: 0, b: 0)
	end
	strip.pixels[at].set(r: 0, g: 0, b: 255)
	client.write(strip)
	
	at += direction

	if at < 0 || at >= length
		direction *= -1
		at += direction
	end

	sleep 0.01
end
