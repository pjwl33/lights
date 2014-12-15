#!/usr/bin/env ruby

require 'trollop'
require 'faderuby'

opts = Trollop::options do
	opt :server, "server address", :type => :string, :default => 'localhost'
	opt :port, "port number", :default => 7890
	opt :pixels, "number of pixels", :default => 100
end


client = FadeRuby::Client.new(opts[:server], opts[:port])
pixels = Array.new(opts[:pixels]).each_with_index.map{|x, i| 0 == i.to_i % 2 ? [255, 0, 0] : [0, 255, 0] }.flatten

while true
	client.set_pixels(pixels)
	pixels.rotate!(3)
	sleep 0.7
end
