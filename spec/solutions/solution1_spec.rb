require 'solutions/solution1'

RSpec.describe Solution1 do

  subject { Solution1.new }

  describe '#calculate' do
    it { expect(subject.calculate).to eql(233168) }
  end

end