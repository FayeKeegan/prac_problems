class Node
	attr_accessor :data, :next_node, :prev_node
	def initialize(data=nil, next_node=nil, prev_node=nil)
		@data = data
		@next_node = next_node
		@prev_node = prev_node
	end

	def to_s
		data_str = "data : " + data.to_s + 
		next_str = "next_node: " + next_node.data.to_s 
		prev_str = "prev_node: " + prev_node.data.to_s
		[data_str, next_str, prev_str].join(",")
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

	def push_top(node)
		prev_head = @head
		node.next_node = prev_head
		@head = node
	end


	def delete_node(node)
		if self.head == node
			@head = @head.next_node
		else 
			check_node = self.head
			found = false
			until check_node.nil? || found
				if check_node.next_node == node
					check_node.next_node = check_node.next_node.next_node
					found = true
				end
				check_node = check_node.next_node
			end
		end
	end

	def to_s
		result = []
		current_node = self.head
		until current_node.nil?
			result.push(current_node.data)
			current_node = current_node.next_node
		end
		result
	end


end

#singly linked list
n1 = Node.new(1)
n2 = Node.new(2)
n3 = Node.new(3)
n4 = Node.new(4)
n1.next_node = n2
n2.next_node = n3
n3.next_node = n4

s_list = SinglyLinkedList.new(n1, n4)
puts (s_list.print).to_s


