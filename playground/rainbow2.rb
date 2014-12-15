#!/usr/bin/env ruby

require 'trollop'
require 'faderuby'
require './rainbow'

opts = Trollop::options do
	opt :server, "server address", :type => :string, :default => 'localhost'
	opt :port, "port number", :default => 7890
	opt :pixels, "number of pixels", :default => 100
end

def blacken(arr, at=0)
	arr.map.with_index{ |rgb,i|
		rgb.map{|level| level*(Math.cos(at + Math::PI*32*i/(arr.length-1))+1)/2}
	}
end

client = FadeRuby::Client.new(opts[:server], opts[:port])
rainbow = Rainbow.new
pixels = Array.new(opts[:pixels]).map.with_index{|x,i| rainbow.at(i/100.0)}

at = 0
while true
	at = 0 if at > pixels.length
	client.set_pixels(
		rainbow.reverse_and_flatten(pixels), 0)
	pixels.rotate!(1)
	at += 1
	sleep 0.05
end
