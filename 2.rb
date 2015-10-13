class Node
	
	attr_accessor :data, :next_node, :prev_node
	def initialize(data=nil, next_node=nil, prev_node=nil)
		@data = data
		@next_node = next_node
		@prev_node = prev_node
	end

end

class SinglyLinkedList
	attr_accessor :head, :tail
	def initialize (head=nil, tail=nil)
		@head = head
		@tail = tail
	end

	def push_bottom(node)
		prev_tail = @tail
		prev_tail.next_node = node
		@tail = node
	end

	def push_top
	end
	

end


class DoublyLinkedList
	attr_accessor :head, :tail
	def initialize (head=nil, tail=nil)
		@head = head
		@tail = tail
	end
end

