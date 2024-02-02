def binary_search(arr, value_to_find)
  low, high = 0, arr.length - 1
  while low <= high
    mid = (low + high) / 2
    return mid if arr[mid] == value_to_find
    if arr[mid] < value_to_find
      low = mid + 1
    else
      high = mid - 1
    end
  end
  return nil
end

puts binary_search([1,2,3,4,5,6,7,8,9, 10], 7)