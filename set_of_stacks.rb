class SetOfStacks
	attr_reader :stacks, :max_height

	def initialize(max_height)
		@max_height = max_height
		@stacks = [[]]
	end

	def push(el)
		if stacks.last.length >= max_height
			stacks.push([el])
		else
			stacks.last.push(el)
		end
	end

	def pop_at_int(int)
		removed_plate = @stacks[int].pop
		i = int
		while i < stacks.length - 1
			plate = stacks[i + 1].pop
			stacks[i].push(plate)
			i += 1
		end
		removed_plate
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
test_set.push(5)
test_set.push(6)
puts test_set.to_s
2.times do test_set.pop end
puts test_set.to_s
test_set.pop_at_int(0)
puts test_set.to_s


