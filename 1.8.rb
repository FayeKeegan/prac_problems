def is_rotation?(str1, str2)
	return (str1+str1).include?(str2)
end


puts is_rotation?("erbottlewat", "waterbottle")
puts is_rotation?("erbottlewat", "waterbottlee")