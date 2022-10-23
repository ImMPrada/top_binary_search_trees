require './spec/spec_helper'

RSpec.describe Tree::Node do
  let(:node) { described_class.new(1) }

  it 'has a data attribute with value' do
    expect(node.data).to be(1)
  end

  it 'has a left child nill attribute' do
    expect(node.left_child).to be_nil
  end

  it 'has a right child nill attribute' do
    expect(node.right_child).to be_nil
  end
end
