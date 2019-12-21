puts ("Please enter your text ")
user_input = gets.chomp
puts ("Please enter your interetions count")
user_iterations = gets.chomp.to_i

class User_text
	def input_data_validate(source, interetions)
		if source == nil or interetions <= 0 
			return false
		else
			return true
		end
	end

	def encrypt(source, iterations)
		
		if input_data_validate(source, iterations) == false
			return source
		else
			#Encrypt algorithm
			changed_arr = source.split('')
      		even_arr = []
      		odd_arr = []
      		for iterator in 0..changed_arr.length-1
        		if iterator % 2 == 0
          			even_arr = even_arr.append(changed_arr[iterator])  
        		else
          			odd_arr = odd_arr.append(changed_arr[iterator])
        		end
      		end
		end
		return encrypt((odd_arr + even_arr).join, iterations-1)
	end

	def decrypt(source, iterations)

		if input_data_validate(source, iterations) == false
			return source

		else
		arr_middle = source.length / 2 
		result = []
			for first_part_index in 0..(source.length - 1) / 2
				second_part_index = first_part_index + arr_middle 
				if first_part_index == (source.length - 1) / 2	and source.length % 2 != 0 
					result.append(source[second_part_index])                                
				else
					result.append(source[second_part_index], source[first_part_index])
				end
			end
		end
		return decrypt(result.join, iterations-1)
	end
end

user1 = User_text.new

p user1.encrypt(user_input, user_iterations)
puts ("Please enter your text ")
user_input = gets.chomp
p user1.decrypt(user_input, user_iterations)


