def merge left_arr, right_arr
  result = []
  i = j = 0
  while left_arr.length > i && right_arr.size > j
    if left_arr[i] > right_arr[j]
      result << right_arr[j]
      j += 1
    elsif right_arr[j] >= left_arr[i]
      result << left_arr[i]
      i += 1
    end
  end
  result += right_arr[j, right_arr.length] if right_arr[j]
  result += left_arr[i, left_arr.length] if left_arr[i]
  result
end

def merge_sort arr
  n = arr.length
  return arr if n < 2
  half = n.even? ? n / 2 : (n + 1) / 2
  left_arr = merge_sort arr[0, half]
  right_arr = merge_sort arr[half, n]
  merge left_arr, right_arr
end
