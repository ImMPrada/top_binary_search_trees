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

  describe '#build_tree' do
    before { bst.build_tree }

    it 'stores a Node element at the root of the tree' do
      expect(bst.root.class).to eq(Tree::Node)
    end

    it 'builds assigns the root node to the tree' do
      expect(bst.root.data).to eq(5)
    end

    describe 'evaluate data stored at each side of the root' do
      it 'stores the data value less than the root at left side' do
        expect(bst.root.left_child.data < bst.root.data).to be(true)
      end

      it 'stores the data value grate than the root at right side' do
        expect(bst.root.right_child.data > bst.root.data).to be(true)
      end
    end
  end

  describe '#find' do
    let(:a_value_in_the_test_array) { test_array.sample }
    let(:a_value_not_in_the_test_array) { 100 }

    before { bst.build_tree }

    describe 'when the value is present in the tree' do
      it 'returns a node' do
        expect(bst.find(a_value_in_the_test_array).class).to eq(Tree::Node)
      end

      it 'returns the node with the value' do
        expect(bst.find(a_value_in_the_test_array).data).to eq(a_value_in_the_test_array)
      end
    end

    describe 'when the value is not present in the tree' do
      it 'returns nil' do
        expect(bst.find(a_value_not_in_the_test_array)).to be_nil
      end
    end
  end
end
