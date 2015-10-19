class Node

	attr_accessor :val, :left, :right

	def initialize(val=nil, left=nil, right=nil)
		@val = val
		@left = left
		@right = right
	end

	def to_s
		@val.to_s
	end


end

class BinaryTree
	attr_accessor :parent

	def initialize(parent)
		@parent = parent
	end

	def bfs(target)
		nodes = [self.parent]
		until nodes.empty?
			# puts nodes.to_s
			node = nodes.shift
			if node.val == target
				return true
			else
				nodes.push(node.left) if node.left
				nodes.push(node.right) if node.right
			end
		end
		false
	end

	def dfs(target, node=parent)
		return false if node.nil?
		if node.val == target
			return true
		else 
			dfs(target, node.left) || dfs(target, node.right)
		end
	end

	def is_balanced?(node=parent)
		return 0 if node.nil?

		if !is_balanced?(node.left) || !is_balanced?(node.right)
			return false
		end

		diff = is_balanced?(node.left) - is_balanced?(node.right)

		if diff > 1 || diff < -1
			return false
		end
		if node == self.parent 
			return true
		else
			return 1 + is_balanced?(node.left) + is_balanced?(node.right)
		end
	end

	def is_route?(node_start, node_end, visited={})
		visited_stack = [node_start]
		visited_hash = {}
		until visited_stack.empty?
			node = visited_stack.pop
			next if visited_hash[node] == true
			visited_hash[node] = true
			if node == node_end
				return true
			else
				visited_stack.push(node.left) if node.left
				visited_stack.push(node.right) if node.right
			end
		end
		false
	end
end

def pre_o_array(parent)
	return [] if parent.nil?
	return [parent.val].concat(pre_o_array(parent.left)).concat(pre_o_array(parent.right))
end

def io_array(parent)
	return [] if parent.nil?
	return io_array(parent.left).concat([parent.val]).concat(io_array(parent.right))
end

def post_o_array(parent)
	return [] if parent.nil?
	return post_o_array(parent.left).concat(post_o_array(parent.right)).concat([parent.val])
end



c1 = Node.new(1)
c2 = Node.new(3)
c1.left = Node.new(5)
c1.right = Node.new(10)
c2.left = Node.new(20)
c2.right = Node.new(0)
parent_node = Node.new(4, c1, c2)
my_tree = BinaryTree.new(parent_node)

unbalancedParent = Node.new(100) 
aa = Node.new(1)
bb = Node.new(1)
cc = Node.new(1)
aa.left = bb
bb.left = cc
unbalancedParent.left = aa
unbalancedParent.right = Node.new(1)
my_unbalanced_tree = BinaryTree.new(unbalancedParent)

a_node = Node.new("a")
b_node = Node.new("b")
c_node = Node.new("c")
d_node = Node.new("d")
e_node = Node.new("e")
f_node = Node.new("f")
g_node = Node.new("g")
h_node = Node.new("h")
i_node = Node.new("i")

wiki_tree = BinaryTree.new(f_node)
f_node.left = b_node
f_node.right = g_node
b_node.left = a_node
b_node.right = d_node
d_node.left = c_node
d_node.right = e_node
g_node.right = i_node
i_node.left = h_node


puts my_tree.bfs(1).to_s + " should be true"
puts my_tree.bfs(12).to_s + " should be false"
puts my_tree.dfs(1).to_s + " should be true"
puts my_tree.dfs(12).to_s + " should be false"
puts my_tree.is_balanced?.to_s + " should be true"
puts my_unbalanced_tree.is_balanced?.to_s + " should be false"
puts my_tree.is_route?(c2.right, c2.left).to_s + " should be false"
puts my_tree.is_route?(parent_node, c2.left).to_s + " should be true"
puts pre_o_array(parent_node).to_s + " [4, 1, 5, 10, 3, 20, 0]"
puts pre_o_array(wiki_tree.parent).map {|el| el.upcase}.to_s + "  [F, B, A, D, C, E, G, I, H]"
puts io_array(wiki_tree.parent).map {|el| el.upcase}.to_s + "[A, B, C, D, E, F, G, H, I]"
puts post_o_array(wiki_tree.parent).map {|el| el.upcase}.to_s + " [A, C, E, D, B, H, I, G, F]"

