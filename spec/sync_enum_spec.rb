# frozen_string_literal: true

# Author: Bruce Tesar

RSpec.describe SyncEnum do
  let(:enum1) { [1, 2, 3].to_enum }
  let(:enum2) { [11, 12, 13].to_enum }
  let(:enum3) { [31, 32].to_enum }

  it 'has a version number' do
    expect(SyncEnum::VERSION).not_to be nil
  end

  context 'with one enumerator' do
    before do
      @syncenum = described_class.new(enum1)
      @results = []
      loop { @results << @syncenum.next }
    end

    it 'returns an array for each element' do
      expect(@results).to eq [[1], [2], [3]]
    end

    it 'raises StopIteration when next is called again' do
      expect { @syncenum.next }.to raise_exception(StopIteration)
    end
  end

  context 'with two enumerators of same length' do
    before do
      syncenum = described_class.new(enum1, enum2)
      @results = []
      loop { @results << syncenum.next }
    end

    it 'returns an array for each pair of elements' do
      expect(@results).to eq [[1, 11], [2, 12], [3, 13]]
    end
  end

  context 'with three enumerators of differing length' do
    before do
      syncenum = described_class.new(enum1, enum2, enum3)
      @results = []
      loop { @results << syncenum.next }
    end

    it 'returns arrays of elements to the end of the shortest' do
      expect(@results).to eq [[1, 11, 31], [2, 12, 32]]
    end
  end

  context 'with no enumerators' do
    before do
      syncenum = described_class.new
      @results = []
      loop { @results << syncenum.next }
    end

    it 'returns nothing' do
      expect(@results).to be_empty
    end
  end
end
