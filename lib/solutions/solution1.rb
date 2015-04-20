require_relative '../modules/multiples'

# https://projecteuler.net/problem=1
class Solution1
  include Multiples

  def solve
    sum_all_multiples
  end

  def describe
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