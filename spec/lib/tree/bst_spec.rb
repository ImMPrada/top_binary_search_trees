require './spec/spec_helper'

RSpec.describe Tree::BST do
  let(:test_array) { [1, 7, 4, 23, 8, 9, 3, 7, 3, 8, 6, 2, 5] }
  let(:bst) { described_class.new(test_array) }

  describe '#initialize' do
    it 'has an array attribute with test array, sorted and no duplicates' do
      expect(bst.instance_variable_get(:@sorted_arr)).to eq(test_array.sort.uniq)
    end

    it 'has a root nill attribute' do
      expect(bst.root).to be_nil
    end
  end
end
