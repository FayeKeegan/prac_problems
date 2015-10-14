class Node
	attr_accessor :data, :next_node, :prev_node
	def initialize(data=nil, next_node=nil, prev_node=nil)
		@data = data
		@next_node = next_node
		@prev_node = prev_node
	end

	def to_s
		data_str = "data : " + data.to_s
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

	def remove_dups_with_hash
		seen = {}
		current_node = head
		until current_node.nil?
			if seen[current_node.data]
				delete_node(current_node)
			else
				seen[current_node.data] = true
			end
			current_node = current_node.next_node
		end
		self
	end

	def remove_dups
		first_runner = head.next_node
		until first_runner.nil?
			second_runner = head
			while second_runner != first_runner
				puts "second: " + second_runner.data.to_s + ", first: " + first_runner.data.to_s
				if first_runner.data == second_runner.data
					delete_node(second_runner)
				end
				second_runner = second_runner.next_node
			end
			first_runner = first_runner.next_node
		end
	end

	def nth_last_element(n)
		current_node = self.head
		while true
			later_node = current_node
			(n-1).times do
				later_node = later_node.next_node
			end
			if later_node.next_node.nil?
				puts "found: " + current_node.data.to_s
				return current_node
			end
			current_node = current_node.next_node
		end
	end

end

#singly linked list

#create nodes
n1 = Node.new(1)
n2 = Node.new(2)
n3 = Node.new(3)
n_dup = Node.new(2)
n4 = Node.new(4)

#link them
n1.next_node = n2
n2.next_node = n3
n3.next_node = n_dup
n_dup.next_node = n4

#make a list
s_list = SinglyLinkedList.new(n1, n4)
puts s_list.to_s


