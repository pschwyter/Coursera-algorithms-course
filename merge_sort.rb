require "pry"

unsorted_array = [5,1,6,2,8,3,7,4,10,14,12,11,13,9]

def merge(left_half_array, right_half_array)
		i = 0
		j = 0
		sorted_array_length = left_half_array.length + right_half_array.length
		sorted_array = Array.new(sorted_array_length)

		sorted_array.map! do |k|
			if left_half_array[i] == nil && right_half_array[j] != nil
				j += 1
				right_half_array[j-1]
			elsif left_half_array[i] != nil && right_half_array[j] == nil
				i += 1
				left_half_array[i-1]
			else
				if (left_half_array[i] < right_half_array[j])
					i += 1
					left_half_array[i-1]
				elsif (right_half_array[j] < left_half_array[i])
					j += 1
					right_half_array[j-1]
				end
			end
		end
		sorted_array
end

def merge_sort(array)
	if array.length <= 1
		return array
	else
		array_length = array.length
		right_half_length = (array_length/2).round
		left_half_length = array_length - right_half_length

		left_half_array = array.first(left_half_length)
		right_half_array = array.last(right_half_length)
		
		sorted_subarray1 = merge_sort(left_half_array)
		sorted_subarray2 = merge_sort(right_half_array)

		sorted_array = merge(sorted_subarray1, sorted_subarray2)

	end
	p sorted_array
end

merge_sort(unsorted_array)

