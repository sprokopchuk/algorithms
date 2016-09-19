require 'byebug'

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


# Inversion
#i < j
#A[i] > A[j]
# left inversion if (i, j) =< N/2
# right inversion if (i, j) > N/2
# split inversion if i =< N/2 < j

def calc_inversions arr
  n = arr.length
  return [0, arr] if n  == 1
  half = n.even? ? n / 2 : (n + 1) / 2
  left_inversions, left_arr = calc_inversions(arr[0, half])
  right_inversions, right_arr = calc_inversions(arr[half, n])
  num_inversions, sorted_arr = count_and_sort_split_inversions(left_arr, right_arr)
  num_inversions = num_inversions + left_inversions + right_inversions
  [num_inversions, sorted_arr]
end

def count_and_sort_split_inversions left_arr, right_arr, num_inversions = 0
  result = []
  i = j = 0
  while left_arr.length > i && right_arr.size > j
    if left_arr[i] > right_arr[j]
      result << right_arr[j]
      num_inversions += left_arr.length - i
      j += 1
    elsif right_arr[j] >= left_arr[i]
      result << left_arr[i]
      i += 1
    end
  end
  result += right_arr[j, right_arr.length] if right_arr[j]
  result += left_arr[i, left_arr.length] if left_arr[i]
  [num_inversions, result]
end

def find_inversions
  arr = File.readlines('integer_array.txt')
  arr.map!(&:to_i)
  calc_inversions(arr).first
end

puts find_inversions
