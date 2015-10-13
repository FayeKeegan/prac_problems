def set_zeros(matrix)
	zero_rows = []
	zero_cols = []
	num_rows = matrix.length
	num_cols = matrix.first.length
	i = 0
	while i < num_rows
		j = 0
		while j < num_cols
			if matrix[i][j] == 0
				zero_rows << i
				zero_cols << j
			end
			j += 1
		end
		i +=1 
	end
	(0...num_rows).each do |row_num|
		(0...num_cols).each do |col_num|
			if zero_rows.include?(row_num)
				matrix[row_num][col_num] = 0
			end
			if zero_cols.include?(col_num)
				matrix[row_num][col_num] = 0
			end
		end
	end
	matrix
end

matrix1 = [[1, 0, 1],
				 [1, 1, 1],
				 [3, 3, 3]]


puts set_zeros(matrix1).to_s