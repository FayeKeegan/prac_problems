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
		if @head.nil?
			@head = node
			@tail = node
		end
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
		#bad solution
		# if self.head == node
		# 	@head = @head.next_node
		# else 
		# 	check_node = self.head
		# 	found = false
		# 	until check_node.nil? || found
		# 		if check_node.next_node == node
		# 			check_node.next_node = check_node.next_node.next_node
		# 			found = true
		# 		end
		# 		check_node = check_node.next_node
		# 	end
		# end

		#better solution, but wont work for tail
		if (node == self.head)
			self.head == node.next_node
		end
		node.data = node.next_node.data
		node.next_node = node.next_node.next_node
		node
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

def sum_linked_lists(list1, list2)
	#set up starting node with value of 0, at head of sum_list
	starting_node = Node.new(0)
	sum_list = SinglyLinkedList.new
	sum_list.push_bottom(starting_node)

	#start with the first three nodes that you want to sum
	starting_node = sum_list.head
	curr_node_1 = list1.head
	curr_node_2 = list2.head

	until curr_node_1.nil? && curr_node_2.nil?
		#get three numbers to sum
		starting_sum = starting_node.data
		num_1 = curr_node_1 ? curr_node_1.data : 0
		num_2 = curr_node_2 ? curr_node_2.data : 0
		current_sum = starting_sum + num_1 + num_2
		
		#update current sum node with the correct sum
		starting_node.data = current_sum % 10

		#add next node to sum node depending on sum
		current_sum >= 10 ? sum_list.push_bottom(Node.new(1)) : sum_list.push_bottom(Node.new(0))
		

		#increment each node by 1
		starting_node = starting_node.next_node
		curr_node_1 = curr_node_1.nil? ? nil : curr_node_1.next_node
		curr_node_2 = curr_node_2.nil? ? nil : curr_node_2.next_node
	end
	#this basically works but has a floating 0 at the end sometimes... should rewrite recursively
	sum_list
end

#singly linked list

#create nodes
nodes = [Node.new(1), Node.new(2), Node.new(3), Node.new(2), Node.new(4)]

#make a list
s_list = SinglyLinkedList.new
nodes.each do |node| s_list.push_bottom(node) end
puts s_list.to_s

#practice with sums

#create numbers
array_109 = [Node.new(9), Node.new(0), Node.new(1)]
array_182 = [Node.new(2), Node.new(8), Node.new(1)]
list_109 = SinglyLinkedList.new()
list_182 = SinglyLinkedList.new()
array_109.each do |node|
	list_109.push_bottom(node)
end
array_182.each do |node|
	list_182.push_bottom(node)
end






