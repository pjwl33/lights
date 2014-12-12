require "faderuby"

@client = FadeRuby::Client.new("10.100.130.22", 7890)
@strip = FadeRuby::Strip.new(100)

# nums = (0..98).step(8).to_a
@blank = {r: 0, g: 0, b: 0}
@blue = { r: 0, g: rand(255), b: rand(255) }
@green = { r: rand(255), g: rand(255), b: 0 }
@red = { r: rand(255), g: 0, b: rand(255) }
@half_count = 0
@quarter_count = 0

def run_dis_shiiii
  while true
    half_notes
    quarter_notes
    @client.write(@strip)
  end
end

def half_notes
  color = @half_count.even? ? @red : @blank
  (24..49).to_a.each do |n|
    @strip.pixels[n].set(color)
  end
  @half_count += 1
  sleep 1.2
end

def quarter_notes
  color = @quarter_count.even? ? @blue : @blank
  (1..23).to_a.each do |n|
    @strip.pixels[n].set(color)
  end
  @quarter_count += 1
  sleep 0.6
end

run_dis_shiiii