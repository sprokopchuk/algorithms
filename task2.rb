require 'byebug'

def quick_sort_first arr
  n = arr.length
  return arr if n <= 1
  l = 0 # first element as a pivot
  p  = arr[l]
  i = l + 1
  j = l + 1
  while j <= n - 1 do
    if arr[j] < p
      arr[j], arr[i] = arr[i], arr[j]
      i += 1
    end
    j += 1
  end
  arr[i - 1], arr[l] = arr[l], arr[i - 1]
  right_arr = quick_sort_first(arr[0, i])
  left_arr = quick_sort_first(arr[i, n])
  right_arr + left_arr
end

end
