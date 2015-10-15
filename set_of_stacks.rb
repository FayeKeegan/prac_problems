class SetOfStacks
	attr_reader :stacks

	def initialize(max_height)
		@max_height = max_height
		@stacks = [[]]
	end

	def push(el)
		if stacks.last.length > max_height
			stacks.push([el])
		else
			stacks.last.push.el
		end
	end

	def pop
		if stacks.last.length == 1
			last_stack = stacks.pop
			last_stack.pop
		else
			stacks.last.pop
		end
	end

	def to_s
		@stacks.to_s
	end

end

test_set = SetOfStacks.new(4)
test_set.push(0)
test_set.push(1)
test_set.push(2)
test_set.push(3)
test_set.push(4)
test_set.push(4)
test.to_s
