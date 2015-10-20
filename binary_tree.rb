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

def d_arrays(parent_node)
	result = [[parent_node]]
	last_depth = result.last 
	while !last_depth.empty?
		next_depth = []
		last_depth.each do |node|
			next_depth.push(node.left) if node.left
			next_depth.push(node.right) if node.right
		end
		result.push(next_depth)
		last_depth = next_depth
	end

	return result
end

def min_d_btree(array)
	return nil if array.empty?
	mid_idx = array.length / 2
	current_node = Node.new(array[mid_idx])
	left_array = array.take(mid_idx)
	right_array = array.drop(mid_idx + 1)
	current_node.left = min_d_btree(left_array)
	current_node.right = min_d_btree(right_array)
	return current_node
end

def dfs_target(current_node, target)
	return false if current_node.nil?
	return true if current_node == target
	return dfs_target(current_node.left, target) || dfs_target(current_node.right, target)
end

def is_ancestor?(parent_node, node1, node2)
	dfs_target(parent_node, node1) && dfs_target(parent_node, node2)
end


def fca(parent_node, node1, node2)
	return false if !is_ancestor?(parent_node, node1, node2)
	if parent_node.left && is_ancestor?(parent_node.left, node1, node2)
		return fca(parent_node.left, node1, node2)
	elsif parent_node.right && is_ancestor?(parent_node.right, node1, node2)
		return fca(parent_node.right, node1, node2)
	else
		return parent_node
	end
end


def is_bst?(node, min=nil, max=nil)
	return true if node.nil?

	if (min && node.val <= min) || (max && node.val > max)
		return false
	end

	is_bst?(node.left, min, node.val) && is_bst?(node.right, node.val, max)

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

node_0 = Node.new(0)
node_1 = Node.new(1)
node_2 = Node.new(2)
node_3 = Node.new(3)
node_4 = Node.new(4)
node_5 = Node.new(5)
node_6 = Node.new(6)
node_9 = Node.new(9)

bst = BinaryTree.new(node_4)
node_4.left = node_2
node_4.right = node_6
node_2.left = node_1
node_2.right = node_3
node_6.left = node_5
node_6.right = node_9



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
puts d_arrays(wiki_tree.parent).map { | array| array.map { |el| el.to_s}}.to_s + " rungs"
min_tree = min_d_btree([0, 1, 2, 3, 4, 5, 6, 7])
puts dfs_target(f_node, "a").to_s + " is true"
puts dfs_target(f_node, "DD").to_s + " is false"
# puts fca(f_node, a_node, d_node).val.to_s + " is B"
puts is_ancestor?(b_node, a_node, d_node).to_s + " is true"
puts fca(f_node, a_node, d_node).val.to_s + " is B"
puts fca(f_node, i_node, h_node).val.to_s + " is G"
puts fca(f_node, c_node, h_node).val.to_s + " is F"
puts fca(f_node, a_node, e_node).val.to_s + " is B"
puts is_bst?(parent_node).to_s + " is false"
puts is_bst?(bst.parent).to_s + " is true"



