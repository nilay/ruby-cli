def bubble_sort(arr)
  (1..(arr.length-1)).reverse_each do |i|
    swapped = false
    (0..(i-1)).each do |j|
      puts "#{arr[j]} > #{arr[j+1]}"
      arr[j], arr[j+1] = arr[j+1], arr[j] if swapped = arr[j] > arr[j+1]
      p arr
    end
    break if not swapped
  end
  arr
end

