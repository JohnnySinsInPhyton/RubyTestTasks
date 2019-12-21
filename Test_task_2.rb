def clear_gramatic(user_text)
	return user_text.downcase.delete "!,.?"
end




def uniq_elements(user_text)
	user_text_arr = user_text.split(' ')
	h = Hash.new
	for i in user_text_arr
		if h.key?(i) == true
			h[i] = h[i] + 1
		else
			h[i] = 1
		end
	end
	if h.length < 3
		return  Array([])
	else
	return  h.sort_by {|key, value| [value, key]}.reverse.collect{|key, value| key}.to_a
	end
end

p uniq_elements(clear_gramatic(gets.chomp))
