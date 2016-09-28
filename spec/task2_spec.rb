require 'rspec'
require './task2'

describe 'task 1' do

  describe '#quick_sort_first' do
    arrs = [[3, 1, 6, 7, 15, 3, 9, 2, 12, 19], [6, 8, 10, 25, 3, 4, 9, 10, 29], [4, 6, 8, 10, -5, 6, 8, 9]]
    arrs.each_with_index do |value, index|
      it 'returns sorted array' do
        expect(quick_sort_first(value)).to eq(value.sort)
      end
    end
  end
end
