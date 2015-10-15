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


puts my_tree.bfs(1).to_s + " should be true"
puts my_tree.bfs(12).to_s + " should be false"
puts my_tree.dfs(1).to_s + " should be true"
puts my_tree.dfs(12).to_s + " should be false"
puts my_tree.is_balanced?.to_s + " should be true"
puts my_unbalanced_tree.is_balanced?.to_s + " should be false"

