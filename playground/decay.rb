require "faderuby"

client = FadeRuby::Client.new("10.100.130.22", 7890)
strip = FadeRuby::Strip.new(100)

blank = {r: 0, g: 0, b: 0}
# nums = (0..98).step(8).to_a
counter = 0
interval = 0.1

while true
  red = { r: 0, g: rand(255), b: rand(255) }
  green = { r: rand(255), g: 0, b: rand(255) }
  blue = { r: rand(255), g: rand(255), b: 0 }
  if counter.even?
    # nums.each do |n|
    #   strip.pixels[n].set(color)
    # end
    strip.pixels.each do |pix|
      color = [red, green, blue].sample
      pix.set(color)
    end
    counter += 1
  else
    strip.pixels.each do |pix|
      pix.set(blank)
    end
    counter += 1
  end

  # if interval >= 1.0
  #   interval = 0.1
  # end

  client.write(strip)
  sleep interval
  interval += 0.03125
end
