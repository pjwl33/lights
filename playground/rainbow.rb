class Rainbow

	MAX_SEGMENTS = 6

	#
	# The RGB value at position X
	#
	def at(x)
		m = 1.0 * MAX_SEGMENTS * x
		n = m.to_i # integer of m
		f = m - n  # Fraction of m

		t = (f * 255).to_i

		#puts "m: #{m} \tn: #{n} \tf: #{f} \tt: #{t}"

		case n
		when 0
			[255, t, 0]
		when 1
			[255 - t, 255, 0]
		when 2
			[0, 255, t]
		when 3
			[0, 255 - t, 255]
		when 4
			[t, 0, 255]
		when 5
			[255, 0, 255 - t]
		else
			[255, 0, 0]
		end
	end

	def reverse_and_flatten(arr)
		mid = arr.length / 2
		(arr[0..(mid-1)].reverse + arr[mid..-1]).flatten
	end
end