def selection_sort(array)
  n = array.length
  for i in 0...n
    mid_idx = i
    for j in (i+1)...n
      if array[j] < array[mid_idx]
        mid_idx = j
      end
    end
    array[i], array[mid_idx] = array[mid_idx], array[i]
    p array
  end
  array
end

# p selection_sort [3,1,6,2,9,0]

