#implement a queue using stacks

class myQueue
	def initialize
		@stack = []
		@reverseStack = []
	end

	def en_q(el)
		@stack.push(el)
	end

	def de_q(el)
		i = 0
		while i < @stack.length
			@reverseStack.push(@stack.pop)
			i += 1
		end
		de_qed_el = @reverseStack.pop
		j = 0
		while j < @reverse_stack.length
			@stack.push(@reverse_stack.pop)
			j += 1
		end
		de_qed_el
	end

end
