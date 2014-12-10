
require "faderuby"

client = FadeRuby::Client.new("10.100.130.22", 7890)

strip = FadeRuby::Strip.new(100)


# length = strip.pixels.length
red = { r: 0, g: rand(255), b: rand(255) }
green = { r: rand(255), g: 0, b: rand(255) }
blue = { r: rand(255), g: rand(255), b: 0 }
blank = {r: 0, g: 0, b: 0}

i = 0
nums = (0..50).to_a.reverse!
nums2 = (50..98).to_a
all_nums = [nums, nums2].flatten

while true
  strip.pixels.each do |pix|
    pix.set(blank)
  end
  if i >= all_nums.length
    i = 0
    all_nums.reverse!
  end

  color = [red, blue, green].sample
  strip.pixels[all_nums[i]].set(color)
  i += 1

  client.write(strip)

  # NOTE VALUES
  bpm = 120
  quarter_note = (60/bpm.to_f)
  eight_note = (30/bpm.to_f)
  sixteenth_note = (15/bpm.to_f)
  thirty_second_note = (7.5/bpm.to_f)

  interval = sixteenth_note.round(2)
  sleep interval
end
