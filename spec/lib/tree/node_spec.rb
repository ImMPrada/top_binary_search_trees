require './spec/spec_helper'

RSpec.describe Tree::Node do
  let(:node) { described_class.new(1) }
  let(:node_left) { described_class.new(2) }
  let(:node_right) { described_class.new(3) }

  it 'has a data attribute with value' do
    expect(node.data).to be(1)
  end

  it 'has a left child nill attribute' do
    expect(node.left_child).to be_nil
  end

  it 'has a right child nill attribute' do
    expect(node.right_child).to be_nil
  end

  describe '#children_case' do
    describe 'when node has no children' do
      it 'returns Tree::CASE_1' do
        expect(node.children_case).to be(Tree::CASE_1)
      end
    end

    describe 'when node has one child' do
      before { node.left_child = node_left }

      it 'returns Tree::CASE_2' do
        node.left_child = node_left
        expect(node.children_case).to be(Tree::CASE_2)
      end
    end

    describe 'when node has two children' do
      before do
        node.left_child = node_left
        node.right_child = node_right
      end

      it 'returns Tree::CASE_3' do
        expect(node.children_case).to be(Tree::CASE_3)
      end
    end
  end
end
