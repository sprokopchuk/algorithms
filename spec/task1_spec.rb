require 'rspec'
require './task1'

describe 'task 1' do
  let(:output_arrs) {[[1, 2, 3, 3, 6, 7, 9, 12, 15, 19], [3, 4, 6, 8, 9, 10, 10, 25, 29], [-5, 4, 6, 6, 8, 8, 9, 10], [1, 3, 6, 7, 15], [1, 3, 6, 7, 15]] }

  describe '#merge' do
    left_arrs = [[1, 3, 6, 7, 15], [6, 8, 10, 25], [4, 6, 8, 10], [13, 6], [7, 15]]
    rigth_arrs = [[2, 3, 9, 12, 19], [3, 4, 9, 10, 29], [-5, 6, 8, 9], [7, 15], [1, 3, 6]]

    left_arrs.each_with_index do |e, i|
      it 'returns merged array' do
        expect(merge(e, rigth_arrs[i])).to eq(output_arrs[i])
      end
    end
  end

  describe '#merge_sort' do
    arrs = [[3, 1, 6, 7, 15, 3, 9, 2, 12, 19], [6, 8, 10, 25, 3, 4, 9, 10, 29], [4, 6, 8, 10, -5, 6, 8, 9]]
    arrs.each_with_index do |value, index|
      it 'returns sorted array' do
        expect(merge_sort(value)).to eq(output_arrs[index])
      end
    end
  end

  describe '#calc_inversions' do
    arrs = { 3 => [1, 3, 5, 2, 4, 6], 5 => [2, 3, 8, 6, 1], 1 => [2, 1] }
    arrs.each do |n, arr|
      it 'returns number of inversions' do
        expect(calc_inversions(arr).first).to eq n
      end
    end
  end
end

