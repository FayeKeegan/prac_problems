#implement a queue using stacks

class MyQueue
	def initialize
		@stack = []
		@reverse_stack = []
	end

	def en_q(el)
		@stack.push(el)
	end

	def de_q
		i = 0
		while i < @stack.length
			@reverse_stack.push(@stack.pop)
			i += 1
		end
		de_qed_el = @reverse_stack.pop
		j = 0
		while j < @reverse_stack.length
			@stack.push(@reverse_stack.pop)
			j += 1
		end
		de_qed_el
	end

	def to_s
		@stack.to_s
	end

end

my_q = MyQueue.new
my_q.en_q(4)
my_q.en_q(2)
my_q.en_q(5)
my_q.en_q(9)
puts my_q.to_s
my_q.de_q
my_q.de_q
my_q.de_q
puts my_q.to_s
