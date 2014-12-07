
require "faderuby"

client = FadeRuby::Client.new("10.7.1.163", 7890)

strip = FadeRuby::Strip.new(50)

next_color = [rand(255), rand(255), rand(255)]
while true
  strip.pixels.each do |pix|
    pix.set(r: next_color[0], g: next_color[1], b: next_color[2])
    client.write(strip)
    sleep 0.2
  end
  sleep 0.2
  next_color = [rand(255), rand(255), rand(255)]
end