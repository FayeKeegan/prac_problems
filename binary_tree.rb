class BinaryTreeNode

	attr_accessor :val, :left, :right

	def initialize(val=nil, left=nil, right=nil)
		@val = val
		@left = left
		@right = right
	end

end

class BinaryTree
	attr_accessor :parent

	def initialize(parent)
		@parent = parent
	end

	def breadth_first_search(target)
		nodes = [self.parent]
		until nodes.empty?
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
end

c1 = Node.new(1)
c2 = Node.new(3)
parent_node = Node.new(4, c1, c2)
c1.left = Node.new(5)
c1.right = Node.new(8)
c2.left = Node.new(0)
c2.right = Node.new(99)