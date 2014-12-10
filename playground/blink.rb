
require "faderuby"

client = FadeRuby::Client.new("10.100.130.22", 7890)

strip = FadeRuby::Strip.new(50)


length = strip.pixels.length
while true
	pix = strip.pixels[rand(length)]
	#color = [rand(255), rand(255), rand(255)]
	pix.set(r: rand(255), g: rand(255), b: rand(255))
	client.write(strip)

  bpm = 60
  interval = (60 / bpm).to_f
  sleep interval
end
