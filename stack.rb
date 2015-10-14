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

end

class ThreeStacks

	def initialize
		@store = [nil]*300
		@pointer1_start, @pointer1_end = 0, 0
		@pointer2_start, @pointer2_end = 100, 100
		@pointer3_start, @pointer3_end = 200, 200
	end

	def push(el, pointer_num)
		if pointer_num == 1
			@store[pointer1_end] = el
			@pointer1_end += 1
		elsif pointer_num == 2
			@store[pointer2_end] = el
			@pointer2_end += 1
		elsif pointer_num == 3
			@store[pointer3_end] = el
			pointer3_end += 1
		end
	end

	def pop(pointer_num)
	
	end

	def resize
	
	end





end

