require_relative '../modules/multiples'

# https://projecteuler.net/problem=1
# Calculate the sum of all multiples of 3 and 5 below 1000.
class Solution1
  include Multiples

  def calculate
    sum_all_multiples
  end

  private

  def sum_all_multiples
    multiples_in_range(1...1000, 3, 5).inject { |sum, n| sum + n }
  end

end