class Stack

	attr_reader :top

	def initialize
		@store = []
		@top = store.last
	end

	def push(el)
		@store.push(el)	
	end

	def pop
		@store.pop
	end

	def peek
		@store.last
	end

	def is_empty?
		@store.empty?
	end

end

def sort_stack_ascending(stack)
	@sorted_stack = Stack.new
	until stack.is_empty?
		el = stack.pop
		if @sorted_stack.is_empty? || @sorted_stack.peek >= el
			@sorted_stack.push(el)
		else
			intermediate_stack = Stack.new
			intermediate_stack.push(sorted_stack.pop)
			until stack.peek > el || stack.peek.is_empty?
				intermediate_stack.push(sorted_stack.pop)
			end
			stack.push(el)
			until intermediate_stack.is_empty?
				sorted_stack.push(intermediate_stack.pop)
			end
		end
	end
	@sorted_stack
	end
end

my_stack = Stack.new
my_stack.push(3)
my_stack.push(2)
my_stack.push(1)
my_stack.push(9)
my_stack.push(0)
my_stack.push(3)

puts my_stack.to_s
sorted_stack = sort_stack_ascending(my_stack)
puts sorted_stack

