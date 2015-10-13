

#not working come back to this
def rotate_matrix(matrix)
	n = matrix.length
	layer = 0
	while layer < array.length / 2
		first = layer
		last = n - layer - 1
		i = 0
		while i < last
			top_l_coord = [first, first]
			top_r_coord = [first, last]
			bottom_r_coord = [last, last]
			bottom_l_coord = [last, first]
			top_num = matrix[first, first].dup
			matrix[first, first] = matrix[last, first]
			matrix[last, first] = matrix[]
		end

	layer += 1
	end

end

matr1 = [[1, 2, 3, 4],
				 [5, 6, 7, 8],
				 [9, 10, 12, 12],
				 [13, 14, 15, 16]]


puts diag_mirror(matr1).to_s
