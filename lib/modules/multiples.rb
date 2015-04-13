module Multiples

  # Given a range of integers, returns an array containing any multiples
  # of the provided base numbers
  def multiples_in_range(range, *base_numbers)
    multiples = []
    range.each do |num|
      multiples << num if multiple_of_any_base?(num, base_numbers)
    end
    return multiples
  end

  # True if the num is a multiple of the base number
  def multiple?(num, base)
    num % base == 0
  end

  private

  # Returns true if num is a multiple of any of an array of base numbers
  def multiple_of_any_base?(num, base_numbers)
    base_numbers.each do |base|
      return true if multiple?(num, base)
    end
    return false
  end

end