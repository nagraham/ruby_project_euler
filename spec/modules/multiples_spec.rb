require 'modules/multiples'

RSpec.describe "Multiples" do
  let(:dummy_class) { Class.new { include Multiples } }
  let(:dummy_obj) { dummy_class.new }

  describe '#multiple?' do
    context 'when the number is a multiple of the base' do
      it { expect(dummy_obj.multiple?(9, 3)).to eq(true) }
      it { expect(dummy_obj.multiple?(10, 5)).to eq(true) }
      it { expect(dummy_obj.multiple?(238, 7)).to eq(true) }
    end

    context 'when the number is not a multiple of the base' do
      it { expect(dummy_obj.multiple?(10, 3)).to eq(false) }
    end
  end

  describe '#multiples_in_range' do
    let(:multiples) { dummy_obj.multiples_in_range(1...10, 3, 5) }
    it { expect(multiples).to eq([3, 5, 6, 9]) }
  end
end