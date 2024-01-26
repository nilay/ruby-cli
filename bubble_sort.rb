def bubble_sort(array)
  loop do
    swapped = false
    ((array.length) -1 ).times do |i|
      array[i], array[i+1] = array[i+1], array[i] if swapped = array[i] > array[i+1]
    end
    break if not swapped
  end
  array
end

p bubble_sort([3,1,6,3,8])