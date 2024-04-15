def bin_search(arr, find_value)
  while arr.length >= 1
    mid = arr.length > 1 ? arr.length/2 : 0
    return true if arr[mid] == find_value
    arr = arr[mid] > find_value ? arr[..(mid-1)] : arr[mid..]
  end
  false
end

def bin_search_for_position(arr, find_value)
  length = arr.length
  mid = arr.length/2
  start = 0

  while mid > start
    return mid if arr[mid] == find_value
    if find_value > arr[mid]
      start = mid
    else
      length = mid
    end
    mid = (start + length)/2
  end
end
