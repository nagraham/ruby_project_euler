require_relative '../modules/multiples'

# https://projecteuler.net/problem=1
# Calculate the sum of all multiples of 3 and 5 below 1000.
class Solution1
  include Multiples

  def solve
    sum_all_multiples
  end

  def description
    thing = <<-DESC
    If we list all the natural numbers below 10 that are multiples of 3 or 5,
    we get 3, 5, 6 and 9. The sum of these multiples is 23.

    Find the sum of all the multiples of 3 or 5 below 1000.
    DESC
  end

  private

  def sum_all_multiples
    multiples_in_range(1...1000, 3, 5).reduce(:+)
  end

end