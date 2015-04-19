require 'models/sequence'

RSpec.describe Sequence do

  subject { Sequence.new }

  let(:empty_sequence) { Sequence.new }

  let(:filled_sequence) do
    s = Sequence.new
    s.set_next(3)
    return s
  end

  describe 'array-like instance methods' do
    it 'should respond to all array-like methods' do
      expect(subject).to respond_to(:[])
      expect(subject).to respond_to(:clear)
      expect(subject).to respond_to(:last)
      expect(subject).to respond_to(:first)
      expect(subject).to respond_to(:each)
      expect(subject).to respond_to(:map)
      expect(subject).to respond_to(:select)
      expect(subject).to respond_to(:inject)
      expect(subject).to respond_to(:reduce)
      expect(subject).to respond_to(:size)
    end
  end

  describe '#initialize' do
    describe 'setting the #algorithm' do
      context 'when a Proc or code block is not provided' do
        it 'should set to the default algorithm' do
          expect(empty_sequence.algorithm).to eql(Sequence::DEFAULT_ALGORITHM)
        end
      end

      context 'when a Proc or code block is provided' do
        let(:sequence_algorithm) { lambda { |sequence | puts sequence } }
        let(:sequence) { Sequence.new(&sequence_algorithm) }
        it 'should set to the given algorithm' do
          expect(sequence.algorithm).to eql(sequence_algorithm)
        end
      end
    end

    context 'when an initial number of elements is specified' do
      let(:number_of_initial_elements) { 5 }
      let(:sequence_with_initial_elements) { Sequence.new(number_of_initial_elements) }
      it 'should have the first n elements' do
        expect(sequence_with_initial_elements.size).to eql(number_of_initial_elements)
        expect(sequence_with_initial_elements.to_a).to eql([0, 1, 2, 3, 4])
      end
    end
  end

  describe '#peek' do
    let(:size_prior_to_peek) { filled_sequence.size }
    let(:next_element) { filled_sequence.peek }

    it 'should return the next element in the sequence' do
      expect(next_element).to eql(3)
    end
    it 'should not alter the sequence itself' do
      expect(filled_sequence.size).to eql(size_prior_to_peek)
    end
  end

  describe '#set_next' do
    context 'with default algorithm' do
      context 'when the sequence is empty' do
        before { empty_sequence.set_next }
        it 'should start with any of its starting values' do
          expect(empty_sequence.to_a).to eq([0])
        end
      end

      context 'without arguments' do
        before { filled_sequence.set_next }
        it 'should set the next element in the sequence' do
          expect(filled_sequence.to_a).to eql([0, 1, 2, 3])
        end
      end

      context 'with arguments' do
        let(:num_of_new_elements) { 3 }
        before { filled_sequence.set_next(num_of_new_elements) }
        it 'should set the number of new elements' do
          expect(filled_sequence.to_a).to eql([0, 1, 2, 3, 4, 5])
        end
      end
    end
  end

  describe '#upto' do
    context 'when the highest current sequence value is lower than the target' do
      let(:target_number) { 10 }
      before { filled_sequence.upto(target_number) }
      it 'should build the sequence up to but not including the target number' do
        expect(filled_sequence.size).to eql(target_number)
        expect(filled_sequence.to_a).to_not include(target_number)
      end
    end

    context 'when the highest current sequence value is higher than the target' do
      let(:target_number) { 1 }
      before { filled_sequence.upto(target_number) }
      it 'should not modify the sequence' do
        expect(filled_sequence.size).to eql(3)
      end
    end
  end

end