def selection_sort(arr)
  for i in 0...arr.length
    min_elm_index = i
    for j in (i)...arr.length
      min_elm_index = j if arr[j] < arr[min_elm_index]
    end
    arr[i], arr[min_elm_index] = arr[min_elm_index], arr[i]
    p arr
  end
  arr
end
