require 'forwardable'

# The Sequence class represents some series of integers defined by some sort
# of pattern or algorithm. The algorithm is passed in as a Proc or code block
# when a new sequence is defined, and it should take one argument for an
# array representing the current sequence, to be used as part of the algorithm.
#
# Example: Create the first 10 numbers in the Fibonacci sequence.
#
#   fibonacci_sequence = Sequence.new(10, [0, 1]) { |s| s[-1] + s[-2] }
#
class Sequence
  extend Forwardable

  def_delegators :@sequence,
                   :clear,
                   :size,
                   :[],
                   :last,
                   :first,
                   :each,
                   :map,
                   :select,
                   :inject,
                   :reduce

  attr_reader :algorithm

  # This serves as example of how to define a sequence algorithm.
  DEFAULT_ALGORITHM = lambda { |sequence| sequence.empty? ? 0 : sequence.last + 1 }

  # Params:
  #  n = The number of elements of the sequence to create
  #  starting_values = The first elements of the sequence
  def initialize(n = 0, starting_values = [], &algorithm)
    @sequence = []
    @starting_values = starting_values
    @algorithm = algorithm.nil? ? DEFAULT_ALGORITHM : algorithm
    set_next(n)
  end

  # Get the next element without modifying the sequence.
  def peek
    if @sequence.size < @starting_values.size
      @starting_values[@sequence.size]
    else
      @algorithm.call(@sequence)
    end
  end

  # Sets the next n number of elements in the sequence.
  def set_next(n = 1)
    new_elements = []
    n.times do
      next_element = peek
      @sequence << next_element
      new_elements << next_element
    end
    return new_elements
  end

  # Calculates the sequence up to, but not including, the given number
  def upto(number)
    set_next while peek < number
    return self
  end

  # Returns a copy of the sequence as an Array
  def to_a
    @sequence.clone
  end
  
end