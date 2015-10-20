#nth fibonacci number

def nth_fib(n)
	return 0 if n <= 1
	return 1 if n == 2
	return nth_fib(n-1) + nth_fib(n-2)
end

#tests

puts nth_fib(6).to_s + " equals 5"