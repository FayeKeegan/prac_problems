class Queue

	attr_reader :front, :back
	
	def initialize(store=[])
		@front = @store.first
		@back = @store.last
	end

	def en_q(el)
		@store.push(el)
		@back = el
	end

	def de_q
		el = @store.shift
		@first = @store.first
		el
	end


end
