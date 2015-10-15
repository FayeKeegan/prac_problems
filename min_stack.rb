class MinStack

def initialize
	@store = []
end

def pop
	return nil if @store.empty?
	prev_top = @store.pop[0]
	@min = @store.last[1]
	@top = @store.last[0]
	prev_top
end

def min
	@store.last[1]
end


def add(el)
	prev_min = @store.last[1]
	new_min = prev_min < el ? prev_min : el
	@store.push()
end




end
