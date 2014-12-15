#!/usr/bin/env ruby

require 'trollop'
require 'faderuby'
require './rainbow'

opts = Trollop::options do
	opt :server, "server address", :type => :string, :default => 'localhost'
	opt :port, "port number", :default => 7890
	opt :pixels, "number of pixels", :default => 100
end

client = FadeRuby::Client.new(opts[:server], opts[:port])
rainbow = Rainbow.new
pixels = Array.new(opts[:pixels]).map.with_index{|x,i| rainbow.at(i/100.0)}
black = Array.new(opts[:pixels]).map.with_index{|x,i| [0,0,0] }

client.set_pixels(black.flatten, 0)

at = 99
fourtynine = black 
fourtynine[at] = pixels[at]

puts fourtynine.inspect

while true
	client.set_pixels(fourtynine.flatten, 0)
	sleep 0.01
end

pixels.each_with_index do |i, n|
	puts "#{n}\t" + i.inspect
	client.set_pixels(black[0,n].flatten + i + black[(n+1)..-1].flatten, 0)
	gets
end


while true
	client.set_pixels(pixels.flatten, 0)
	pixels.rotate!(1)
	sleep 0.01
end
