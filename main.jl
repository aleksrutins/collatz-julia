module Collatz
	function calc_all(max::Int)
		Threads.@threads for i = 1:max
			calc(i)
		end
	end;

	function calc(i::Int)
		println("Number: $i")
		x = i
		steps = 0
		while true
			println("$i -> $x")
			if x % 2 == 0
				x = x ÷ 2
			else
				x = (x * 3) + 1
			end
			steps += 1
			if x == 1
				println("Proven for $i in $steps steps.")
				break
			end
		end
	end;
	export calc_all
end;